.data
nums: .word 2, 7, 11, 15   # nums[4] = {2, 7, 11, 15}
target: .word 9            # target = 9
str: .string "The answer is "
len: .word 4               # nums.size() = 4
space: .string " "

.text



main:
    la s1, nums           # s1 = nums
    lw s2, target         # s2 = target
    lw s3, len            # s3 = sizeof(nums)
    add t0, zero, zero    # i = 0
    jal ra, loop          # jump to for loop
branch:
    la a0, str            # load string
    li a7, 4              # print string
    ecall                 
    add a0, t0, zero      # load  integer
    li a7, 1              # print result  
    ecall
    la a0, space            # load string
    li a7, 4              # print string
    ecall 
    add a0, t1, zero      # load string
    li a7, 1              # print result
    ecall
    li a7, 10             # end problem
    ecall

loop:
    lw t3, 0(s1)          # t3 = nums[i]
    sub t2, s2, t3        # complement = target - nums 
    addi t1, t0,1         # j = i+1
    addi s4, s1, 4        # nums[j] = nums[i+1]  
    
loop2:
    lw t3, 0(s4)          # t3 = nums[j]
    beq t3, t2, branch    # if complement = nums[j]    go to branch
    addi s4, s4, 4        # nums[j++]
    addi t1, t1, 1        # j++
    blt t1, s3, loop2  
    addi s1, s1, 4        # nums[i++]
    addi t0, t0,1         # i++
    blt t0, s3, loop      # if i<4, go to loop
    jr ra                 #
    