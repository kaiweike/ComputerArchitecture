.data
    nums: .word 1,2,3,1           # nums[] = {1,2,3,1}
    len:  .word 4                 # array length =4
    str:  .string "The order of peak element is "

.text

main:
    la   s1, nums                 # s1 = nums
    lw   s2, len                  # s2 = 4                               //4
    add  s3, zero, zero           # l = 0                                //0
    addi s4, s2, -1               # r = 4 - 1                            //3

while:
    bge  s3, s4, exit             # while(left < right) => if (left >= right) then break

    sub  t1, s4, s3               # t1: right - left                     //3
    srli t2, t1, 1                # t2: (right - left)/2                 //1
    add  t3, s3, t2               # t3: mid = left + (right - left)/2    //1
	
    slli t4, t3, 2                # t4: address t3*4                     //1*4=4
    add  t5, s1, t4               # t5: address nums+t4                  //0+4=4
    addi t6, t5, 4                # t6: address nums+t4+1                //0+4+4=8

    lw  s5, 0(t5)                 # s5: nums[mid]                        //nums[1]=2
    lw  s6, 0(t6)                 # s6: nums[mid+1]                      //nums[2]=3

    blt s6, s5, if                # if nums[mid] > nums[mid+1]
    blt s5, s6, else              # else nums[mid] < nums[mid+1]

if:
    addi s4, t3, 0                # right = mid
    j while                       # jump to while

else:
    addi s3, t3, 1                # left = mid + 1
    j while                       # jump to while

exit:
    addi s7, s3, 0                # s7 = left
    jal  ra, print                # jump to print

print:
    la  a0, str                   # load string
    li  a7, 4
    ecall

    add a0, s7, zero              # load result
    li  a7, 1                     # print
    ecall

    li  a7, 10                    # end program
    ecall
