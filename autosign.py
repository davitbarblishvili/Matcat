"""
Author: Andreas
Desc.:  This script sign our testcases
Refs:   https://gitpython.readthedocs.io/en/stable/tutorial.html

"""

import os
from git import Repo

mcFiles = []

for root, dirs, files in os.walk("tests"):
    for file in files:
        if file.endswith('.mc'):
            mcFiles.append(os.path.join(root, file))

repo = Repo(".")
assert not repo.bare

for file in mcFiles:
    with open(file, 'r+') as f:
        content = f.read()
        first_line = content.splitlines()[0]
        if first_line.startswith(("/*", "//")):
            print(f"{file} is signed.")
            continue
        
        commits = repo.iter_commits('--all', paths=file)
        print(file)
        authors = []
        for commit in commits:
            author = commit.committer.name.split()[0]
            if author in authors or author.startswith("GitHub"):
                continue
            authors.append(author)
        print(authors)
        if len(authors) == 1:
            f.seek(0, 0)
            line = f"// Author: {authors[0]}"
            f.write(line.rstrip('\r\n') + '\n' + content)
