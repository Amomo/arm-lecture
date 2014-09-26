	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, r6, lr}

        mov r3, #-1
        @ previous = -1
        mov r4, #1
        @ result = 1
        mov r5, #0
        @ sum = 0

        mov r6, #0
        @ i = 0

loop:
        add r5, r4, r3
        @ sum = result + previous
        mov r3, r4
        @ previous = result
        mov r4, r5
        @ result = sum

        add r6, r6, #1
        @ i = i + 1
        cmp r6, r0
        @ if( i <= x) goto loop
        blt loop

        mov r0, r5
        @ copy r5(sum) to r0 as return value

	pop {r3,r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
