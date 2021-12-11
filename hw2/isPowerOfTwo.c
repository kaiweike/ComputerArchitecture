int isPowerOfTwo(int n){    
    return (n > 0) && (!(n & (n-1)));
}

void _start(){
    volatile char* tx = (volatile char*) 0x40002000;
    int n = 16;
    const char* ans;
    
    if(isPowerOfTwo (n)) 
    	ans = "True";
    else 
    	ans = "False";
    
    while (*ans) {
        *tx = *ans;
        ans++;
    }
}
