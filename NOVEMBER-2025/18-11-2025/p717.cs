public class Solution {
    public bool IsOneBitCharacter(int[] bits) {
        var i = 0 ;
        while(i < bits.Length -1)
        {
            if(bits[i] == 0)
            {
                i += 1;
            }    
            else
            {
                i += 2;
            }
        }
        return i ==  bits.Length -1 && bits[i] == 0; 
    }
}