; ModuleID = 'MatCat'
source_filename = "MatCat"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.4 = private unnamed_addr constant [4 x i8] c"%g \00"
@fmt.5 = private unnamed_addr constant [2 x i8] c"\0A\00"

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %b1 = alloca i1
  %b2 = alloca i1
  %r = alloca i1
  %r1 = load i1, i1* %r
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i1 %r1)
  ret i32 0
}
