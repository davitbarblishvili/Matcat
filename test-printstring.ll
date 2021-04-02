; ModuleID = 'MatCat'
source_filename = "MatCat"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.4 = private unnamed_addr constant [4 x i8] c"%g \00"
@fmt.5 = private unnamed_addr constant [2 x i8] c"\0A\00"
@tmp = private unnamed_addr constant [12 x i8] c"hello world\00"

declare i32 @printf(i8*, ...)

define void @main() {
entry:
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @tmp, i32 0, i32 0))
  ret void
}
