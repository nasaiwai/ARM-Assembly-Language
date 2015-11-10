.syntax unified

.text

.align 8
.global search_ARM
.func search_ARM, search_ARM
.type search_ARM, %function

search_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0, int val is in r1)
    @-----------------------

    LDR r5, [r0] @ dereference the ls of the array and set it to r5
    LDR r6, [r0, #4] @ dereference and get the size of the next struct put it r6
    LDR r7, [r5] @ set the 1st element of the sorted array to r7
    MOV r3, #0 @ set the index in which is r3 to 0
loop:
    CMP r7, r1 @ if the element is equal to the val
    BEQ return1 @ if it is equal then it will go to return1
    ADD r3,r3, #1 @ incremenet the index (r3) by 1
    LDR r7, [r5,r3,LSL #2] @ go to the next element of sortedlist and store it in r7
    CMP r3, r6 @ compare and see whether the index is less than the size
    BLT loop @ if it is not equal then keep looping
    b return



    @ put your return value in r0 here:
return1: 
    MOV r0, r3 @ move the index to r0
    B end
return:
    MOV r0, #-1 @ move the -1 number to r0 which it will return -1
end:
    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

