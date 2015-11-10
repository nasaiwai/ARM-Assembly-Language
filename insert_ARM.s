/*
 * Program Assignement 2
 * Date: 11/01/2015
 *
 */

.syntax unified

.text
.extern realloc

.align 8
.global insert_ARM
.func insert_ARM, insert_ARM
.type insert_ARM, %function

insert_ARM:
@ Save caller's registers on the stack
push {r4-r11, ip, lr}

@ YOUR CODE GOES HERE (list *ls is in r0, int val in r1)
  @-----------------------

@ (your code)
  @ dereference ls -> sortedList and put it in r4
  LDR r4, [r0]
  MOV r7, r0 @ move the struct to r7
  MOV r6, r1 @ move the value to delete to r6

  @ dereference ls -> size 
  LDR r5, [r0, #4] 

  @ dereference ls -> maxSize
  LDR r9, [r0, #8] @get the max element of the stuct
  
  @ if size = 0, insert r1 in the first index of the array
  CMP r5, #0

  @ if size != 0, continues		
  BEQ size0

  @ if size == sizeMax, double the size of the array
  CMP r5, r9 @compare it with the size element
  BNE else
  MOV r1,r9, LSL #3 @ double the array
  MOV r0, r4 @ move the array to the first argument for realloc
  BL realloc
  CMP r0, #0  @ check if the realloc is successful
  BEQ exception @ if realloc unsucceeded
  MOV r9, r9, LSL #1 @ move the value of max element to r9
  
else:
  SUB r8,r5,#1  @ set the index from the length-1
 

loop:
  LDR r10,[r4,r8, LSL #2]@ the element value r8
  CMP r8, #-1 @ if the index gets through -1
  BEQ smallest
  CMP r6, r10		@if r6 < r10, 
  BLT r6lessr10
  ADD r12, r8,#1
  STR r6, [r4 ,r12, LSL #2 ]
  B beforeend

r6lessr10: @ADD r5, r5, #1	@size += 1
  ADD r12, r8, #1 @ r12 is the next element after r8
  STR r10, [r4, r12, LSL #2]	@put r7 into index r9
  SUB r8, r8, #1	@ decrement the last index of the index in one
  B loop


  @ if the size element is zero 
size0: 
  STR r6, [r4] 	@put val in the first element of the array
  MOV r8, #0
  B beforeend
  
smallest:
  STR r6, [r4] @ insert the smallest element to the first index
  ADD r8, r8,#1
  B beforeend
beforeend:
  ADD r5, r5,#1 @ increment the size element
  STR r5, [r7,#4] @ store the value to the struct
  STR r9, [r7,#8] @ store the max element to the struct
  B end

  @ put your return value in r0 here:

  @-----------------------
exception:
  MOV r8, #-1

end:
  MOV r0, r8 @ if it is successful

  @ restore caller's registers
  pop {r4-r11, ip, lr}

  @ ARM equivalent of return
  BX lr
  .endfunc

  .end

