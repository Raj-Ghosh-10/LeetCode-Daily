class Solution {
  int maximumLength(List<int> nums) {
    int e=0,o=0,ae=1;
    bool c=true;
    if (nums[0]%2!=0) {c=false; o++;}
    else {e++;}
    for (int i=1; i<nums.length; i++)
    {
       if (nums[i]%2==0) {e++;}
       else {o++;}
        if (c==true && nums[i]%2!=0) {ae++; c=false;}
        else if (c==false && nums[i]%2==0) {ae++; c=true;} 
    }
    if (ae>=e && ae>=o) {return ae;}
    else if (o>=ae && o>=e) {return o;}
    return e;
  }
}