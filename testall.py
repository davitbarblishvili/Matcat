"""
Author:         Andreas
Description:    Replace testall.sh
Requirements:   Python >3.6, and the imported libraries
Usage:
                py testall.py <test_dir, default: tests>
                Check if matcat.native is built
                Check if there is any weird file in ./tests
                Step through a list of files
                Compile, run, and check the output of each expected-to-work test
                Compile and check the error of each expected-to-fail test
References:
                https://docs.python.org/3/library/argparse.html
                https://docs.python.org/3/library/fnmatch.html#fnmatch.fnmatch
                https://stackoverflow.com/questions/3207219/how-do-i-list-all-files-of-a-directory
                https://stackoverflow.com/questions/678236/how-to-get-the-filename-without-the-extension-from-a-path-in-python
                https://stackoverflow.com/questions/3751900/create-file-path-from-variables
                https://stackoverflow.com/questions/54208417/how-to-check-if-popen-from-subprocess-throws-an-error
                https://stackoverflow.com/questions/11540854/file-as-command-line-argument-for-argparse-error-message-if-argument-is-not-va
                https://stackoverflow.com/questions/38834378/path-to-a-directory-as-argparse-argument
"""
import argparse
from colorama import Fore, Style
import fnmatch
import os
import subprocess


LLI = "lli"
LLC = "llc"
CC = "cc"
MCEXTENSION = ".mc"
OUT = ".out"
ERR = ".err"
MATCAT = "matcat.native"
TESTS_DIR_NAME = "tests"
RUNSH = "./run.sh"


def print_w(s):
    print(Fore.RED + f"WARNING: {s}")
    print(Style.RESET_ALL, end='')


def print_r(s):
    print(Fore.RED + s)
    print(Style.RESET_ALL, end='')


def print_g(s):
    print(Fore.GREEN + s)
    print(Style.RESET_ALL, end='')

# https://stackoverflow.com/a/51212150/13109740
def dir_path(string):
    if os.path.isdir(string):
        return string
    else:
        raise NotADirectoryError(string)


parser = argparse.ArgumentParser(
    description='Fancy Automated Integreation Test for Matcat')
parser.add_argument('--dir',
                    dest="tests_dir", default=TESTS_DIR_NAME,
                    help='select the tests directory', metavar="FILE",
                    type=dir_path)
args = parser.parse_args()

tests_dir = args.tests_dir

if MATCAT not in os.listdir("."):
    print_w(f"{MATCAT} not found. Please make Matcat first.")
    exit(-1)

positive_tests = []
negative_tests = []
expected_res = []
for file in os.listdir(tests_dir):
    if fnmatch.fnmatch(file, f'test*{MCEXTENSION}'):
        positive_tests.append(file)
    elif fnmatch.fnmatch(file, f'fail*{MCEXTENSION}'):
        negative_tests.append(file)
    elif fnmatch.fnmatch(file, f'*{OUT}') or fnmatch.fnmatch(file, f'*{ERR}'):
        expected_res.append(file)
    else:
        print_w(f"{file} is not recognized.")


def get_fname(file):
    base = os.path.basename(file)
    fname = os.path.splitext(base)[0]
    return fname


def clean_up(fname):
    os.remove(f"./{fname}.ll")
    os.remove(f"./{fname}.s")
    os.remove(f"./{fname}.exe")


# Book keeping vars
checked = 0
skipped = 0
passed = 0
for test in positive_tests + negative_tests:
    is_positive_test = test in positive_tests
    expected_fname = get_fname(test)

    if is_positive_test:
        expected_fname += f"{OUT}"
    else:
        expected_fname += f"{ERR}"
    if expected_fname not in expected_res:
        print_w(f"{expected_fname} not found. This test is skipped.")
        skipped += 1
        continue

    checked += 1
    s = test+"..."
    print(f"{s.ljust(35)}", end='')

    test_path = os.path.join(tests_dir, test)
    fname = get_fname(test)

    llvm = subprocess.run([f"./{MATCAT}", test_path],
                          stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if llvm.returncode != 0:
        if not is_positive_test:
            passed += 1
            print_g("PASSED. Failed at semantic checking.")
        else:
            print_r("FAILED")
        continue

    llvm_ir = llvm.stdout.decode()
    with open(f"{fname}.ll", "w") as f:
        f.write(llvm_ir)

    llvm_compile = subprocess.run([LLC, "-relocation-model=pic", f"{fname}.ll"],
                                  stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if llvm_compile.returncode != 0:
        s = llvm_compile.stderr.decode()
        if not is_positive_test:
            passed += 1
            print_g("PASSED. Failed at llvm compile.")
        else:
            print_r("FAILED")

        clean_up(fname)
        continue

    # a *.s file should be generated at this point

    # Matrix Library is linked hardcoded here:
    clang_compile = subprocess.run([CC, "-o", f"{fname}.exe", f"{fname}.s", "matrixLibrary.o", "-lm"],
                                   stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if clang_compile.returncode != 0:
        s = clang_compile.stderr.decode()
        if not is_positive_test:
            passed += 1
            print_r("PASSED, clang compile failed, maybe sth is wrong.")
        else:
            print_r("FAILED, clang compile failed.")

        clean_up(fname)
        continue

    # a *.exe file shoulbe be generated at this point

    if not is_positive_test:
        print_r("FAILED, it should not compile.")
        clean_up(fname)
        continue

    # compare their results
    run_exe = subprocess.run([f"./{fname}.exe"],
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if clang_compile.returncode != 0:
        print_r("FAILED. Failed at running time. Maybe something is wrong")
        clean_up(fname)
        continue

    run_result = run_exe.stdout.decode().rstrip()
    test_op_path = os.path.join(tests_dir, f"{fname}{OUT}")
    expected_result = open(test_op_path).read().rstrip()
    if run_result != expected_result:
        print_r("FAILED. Output does not match.")

        # These are processed strings without trailing spaces
        print(f"\tExpected: {expected_result.encode()}")
        print(f"\tActual:   {run_result.encode()}")
        clean_up(fname)
        continue

    print_g("PASSED")
    passed += 1
    clean_up(fname)

print("\nTest summary:")
print_g(f"Passed: {passed}/{checked}")
print_r(f"Failed: {checked - passed}/{checked}")

if skipped:
    print_r(f"Skipped: {skipped}")
