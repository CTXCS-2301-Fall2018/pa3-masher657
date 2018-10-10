@Asher Khan; October 10, 2018
@This code will run a vending machine program that gives you an option of 3 snacks to pick. After you pick a snack it will ask you for the quantity.
@Once you choose quantity, it will tell you the cost of your snacks.

@Vending machine code

    .global main
    .extern printf
main:
    @@@ Print out "menu" of choices.
    LDR R0, =msg0       @prints out message 0
    BL printf
    LDR R0, =msg1       @prints out message 1
    BL printf
    LDR R0, =msg2       @prints out message 2
    BL printf
    LDR R0, =msg3       @prints out message 3
    BL printf
    LDR R0, =msg4       @prints message 4
    BL printf
    @@@ Have user enter in their selection
    @@@ Store selection in variable select
    LDR R0, =inp
    LDR R1, =select
    BL scanf
    @@@ Prompt user for quantity
    LDR R0, =msg5
    BL printf
    @@@ Have user enter value into variable
    @@@ Quantity
    LDR R0, =inp
    LDR R1, =quantity
    BL scanf

    LDR R1, =select  @Address of var select
    LDR R1, [R1]     @Value of select in R1

    @Your modifications will begin at this point

    CMP R1, #2      @Compares R1 with 2

    MOVLT R3, #75     @if R1 is < 2, then R3 will hold 75
    MOVEQ R3, #125    @if R1 is = 2, then R3 will hold 125
    MOVGT R3, #90     @if R1 is > 2, then R3 will hold 90
    CMP R1, #3          @if R1 is > 3, then the illegal selection will run
    LDRGT R0, =msg7    @If we get here user entered
                     @an illegal selection so print
                     @error message and terminate
    BLGT printf
    MOVGT R7, #1
    SWIGT #0           @Terminate, error condition

    LDR R4, =quantity @Get address of var quantity
    LDR R4, [R4]      @Value of quantity now in R4
    MUL R1, R3, R4    @Multiply number of cents times quantity
                      @and put result in R1
    LDR R0, =msg6     @Final message
    BL printf
    MOV R7, #1        @Normal exit
    SWI #0


.data
select: .word 0
quantity: .word 0
msg0: .asciz "CSC2301 Vending machine!\n"
msg1: .asciz "Enter your choice:\n"
msg2: .asciz "1 for peanuts @ 75 cents\n"
msg3: .asciz "2 for chocolate @ $1.25\n"
msg4: .asciz "3 for pretzels @ 90 cents\n"
msg5: .asciz "Enter quantity\n";
msg6: .asciz "Your total is: %d cents\n";
msg7: .asciz "Illegal selection.  Goodbye\n"
inp: .asciz "%d"


