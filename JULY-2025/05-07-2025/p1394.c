int findLucky(int* arr, int arrSize) {
    int i=0,max =-1,m=arr[0];
    for(i=1;i<arrSize;i++){
        if(m<arr[i]) m = arr[i];
    }
    m++;
    int a[m];
    memset(a,0,sizeof(a));
    for(i=0;i<arrSize;i++){
        int j = arr[i];
        a[j]=a[j]+1;
    }
    for(i=1;i<m;i++){
        if(a[i] == i ) max = i;
    }
    return max;
}