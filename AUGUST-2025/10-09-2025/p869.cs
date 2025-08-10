public class Solution {
    private static readonly HashSet<string> Pow2Signatures = BuildPow2Signatures();

 private static HashSet<string> BuildPow2Signatures()
 {
     var set = new HashSet<string>();
     for (int i = 0; i < 31; i++)
     {
         int val = 1 << i;
         set.Add(SortDigits(val));
     }
     return set;
 }

 private static string SortDigits(int x)
 {
     var chars = x.ToString().ToCharArray();
     Array.Sort(chars);
     return new string(chars);
 }

 public bool ReorderedPowerOf2(int n)
 {
     return Pow2Signatures.Contains(SortDigits(n));
 }
}