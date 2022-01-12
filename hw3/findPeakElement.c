#include <stdio.h>

volatile int main(void){
    
    volatile int nums[4] = { 1, 2, 3, 1};
    volatile int numSize = 4;
    
    volatile int left = 0;
    volatile int right = numSize - 1;
    
    while(left < right){
        
        volatile int mid = left + (right - left) / 2;
        
        if(nums[mid] > nums[mid + 1])
            right = mid;
        else
            left = mid + 1;
    }
    
    volatile int peak = left;
    printf("The order of peak element is %d\n", peak);
    return 0;
}
