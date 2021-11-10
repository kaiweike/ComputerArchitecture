/**
*LeetCode 162. Find Peak Element
*Given an integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.
*/

#include <stdio.h>

int main(){
    
    int nums[4] = { 1, 2, 3, 1};
    int numSize = 4;
    
    int left = 0;
    int right = numSize - 1;
    
    while(left < right){
        
        int mid = left + (right - left) / 2;
        
        if(nums[mid] > nums[mid + 1])
            right = mid;
        else
            left = mid + 1;
    }
    
    int peak = left;
    printf("The order of peak element is %d", peak);
    return 0;
}
