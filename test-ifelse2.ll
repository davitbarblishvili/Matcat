; ModuleID = 'MatCat'
source_filename = "MatCat"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.4 = private unnamed_addr constant [4 x i8] c"%g \00"
@fmt.5 = private unnamed_addr constant [2 x i8] c"\0A\00"
@tmp = private unnamed_addr constant [10 x i8] c"goodprint\00"
@tmp.6 = private unnamed_addr constant [9 x i8] c"badprint\00"

declare i32 @printf(i8*, ...)

define i32 @main() {
entry:
  %b = alloca i1
  %b1 = load i1, i1* %b
  br i1 %b1, label %then, label %else

merge:                                            ; preds = %else, %then
  %b2 = load i1, i1* %b
  %tmp = xor i1 %b2, true
  br i1 %tmp, label %then4, label %else6

then:                                             ; preds = %entry
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @tmp, i32 0, i32 0))
  br label %merge

else:                                             ; preds = %entry
  br label %merge

merge3:                                           ; preds = %else6, %then4
  ret i32 0

then4:                                            ; preds = %merge
  %printf5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @tmp.6, i32 0, i32 0))
  br label %merge3

else6:                                            ; preds = %merge
  br label %merge3
}
