class Solution {
public:
    void build(int i, int l, int r, vector<int>& segment,
               vector<int>& baskets) {
        if (l == r) {
            segment[i] = baskets[l];
            return;
        }

        int md = l + (r - l) / 2;
        build(2 * i + 1, l, md, segment, baskets);
        build(2 * i + 2, md + 1, r, segment, baskets);

        segment[i] = max(segment[2 * i + 1], segment[2 * i + 2]);
    }

    bool segmentQuery(int i, int l, int r, vector<int>& segment, int fruit) {

        if (segment[i] < fruit)
            return false;

        if (l == r) {
            segment[i] = -1;
            return true;
        }
        int md = l + (r - l) / 2;
        bool placed = false;
        if (segment[2 * i + 1] >= fruit) {
            placed = segmentQuery(2 * i + 1, l, md, segment, fruit);
        } else
            placed = segmentQuery(2 * i + 2, md + 1, r, segment, fruit);

        segment[i] = max(segment[2 * i + 1], segment[2 * i + 2]);
        return placed;
    }

    int numOfUnplacedFruits(vector<int>& fruits, vector<int>& baskets) {
        int n = baskets.size();
        vector<int> segment(4 * n, -1);

        build(0, 0, n - 1, segment, baskets);

        int unplaced = 0;

        for (int& fr : fruits) {
            if (segmentQuery(0, 0, n - 1, segment, fr) == false)
                unplaced++;
        }
        return unplaced;
    }
};