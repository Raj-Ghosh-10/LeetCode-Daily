public class Solution
{
    public double SoupServings(int n)
    {
        Dictionary<(int, int), double> dp = new Dictionary<(int, int), double>();
        if (n >= 4800)
            return 1;

        return SoupHelper(n, n, dp);
    }

    public double SoupHelper(int leftA, int leftB, Dictionary<(int, int), double> dp)
    {
        if (leftA <= 0)
            return leftB > 0 ? 1.0 : 0.5;

        if (leftB <= 0)
            return 0;

        if (dp.ContainsKey((leftA, leftB)))
            return dp[(leftA, leftB)];

        return dp[(leftA, leftB)] =
            (SoupHelper(leftA - 100, leftB, dp) +
            SoupHelper(leftA - 75, leftB - 25, dp) +
            SoupHelper(leftA - 50, leftB - 50, dp) +
            SoupHelper(leftA - 25, leftB - 75, dp)) / 4;
    }
}