public class Solution
{
    private int[] _segmentTree = null!;

    public int NumOfUnplacedFruits(int[] fruits, int[] baskets)
    {
        var n = fruits.Length;
        _segmentTree = new int[4 * n];
        BuildSegmentTree(baskets, 0, n - 1, 1);

        return fruits.Select(fruit => SearchAndUpdate(1, 0, n - 1, fruit)).Count(position => position == -1);
    }

    private void BuildSegmentTree(int[] baskets, int start, int end, int index)
    {
        if (start == end)
        {
            _segmentTree[index] = baskets[start];
            return;
        }

        var mid = (start + end) / 2;
        BuildSegmentTree(baskets, start, mid, 2 * index);
        BuildSegmentTree(baskets, mid + 1, end, 2 * index + 1);

        _segmentTree[index] = Math.Max(_segmentTree[2 * index], _segmentTree[2 * index + 1]);
    }

    private int SearchAndUpdate(int index, int start, int end, int requiredCapacity)
    {
        if (_segmentTree[index] < requiredCapacity)
        {
            return -1;
        }

        if (start == end)
        {
            _segmentTree[index] = -1;
            return start;
        }

        var mid = start + (end - start) / 2;

        // Prefer left segment for minimum index
        var result = _segmentTree[2 * index] >= requiredCapacity
            ? SearchAndUpdate(2 * index, start, mid, requiredCapacity)
            : SearchAndUpdate(2 * index + 1, mid + 1, end, requiredCapacity);

        _segmentTree[index] = Math.Max(_segmentTree[2 * index], _segmentTree[2 * index + 1]);

        return result;
    }
}