public class Solution {
    public string[] good = new string[] {"999", "888", "777", "666", "555", "444", "333", "222", "111", "000"};

    public string LargestGoodInteger(string num) {
        foreach (string s in good)
            if (num.Contains(s))
                return s;
        return "";
    }
}