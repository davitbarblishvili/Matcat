	.text
	.file	"MatCat"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movb	7(%rsp), %al
	testb	%al, %al
	je	.LBB0_1
# %bb.4:                                # %then
	leaq	.Lfmt.2(%rip), %rdi
	leaq	.Ltmp(%rip), %rsi
	xorl	%eax, %eax
	callq	printf@PLT
.LBB0_1:                                # %merge
	cmpb	$1, 7(%rsp)
	je	.LBB0_3
# %bb.2:                                # %then4
	leaq	.Lfmt.2(%rip), %rdi
	leaq	.Ltmp.6(%rip), %rsi
	xorl	%eax, %eax
	callq	printf@PLT
.LBB0_3:                                # %merge3
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Lfmt,@object           # @fmt
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lfmt:
	.asciz	"%d\n"
	.size	.Lfmt, 4

	.type	.Lfmt.1,@object         # @fmt.1
.Lfmt.1:
	.asciz	"%g\n"
	.size	.Lfmt.1, 4

	.type	.Lfmt.2,@object         # @fmt.2
.Lfmt.2:
	.asciz	"%s\n"
	.size	.Lfmt.2, 4

	.type	.Lfmt.3,@object         # @fmt.3
.Lfmt.3:
	.asciz	"%g\n"
	.size	.Lfmt.3, 4

	.type	.Lfmt.4,@object         # @fmt.4
.Lfmt.4:
	.asciz	"%g "
	.size	.Lfmt.4, 4

	.type	.Lfmt.5,@object         # @fmt.5
.Lfmt.5:
	.asciz	"\n"
	.size	.Lfmt.5, 2

	.type	.Ltmp,@object           # @tmp
.Ltmp:
	.asciz	"goodprint"
	.size	.Ltmp, 10

	.type	.Ltmp.6,@object         # @tmp.6
.Ltmp.6:
	.asciz	"badprint"
	.size	.Ltmp.6, 9


	.section	".note.GNU-stack","",@progbits
