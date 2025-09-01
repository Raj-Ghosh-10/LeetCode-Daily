class Solution {
    public double maxAverageRatio(int[][] classes, int extraStudents) {
        int n = classes.length;
        PriorityQueue<double[]> pq = new PriorityQueue<>((a, b) -> Double.compare(b[0], a[0]));

        for (int i = 0; i < n; i++) {
            int pass = classes[i][0];
            int total = classes[i][1];
            double currPR = (double) pass / total;
            double nextPR = (double) (pass + 1) / (total + 1);
            double gainPR = nextPR - currPR;
            pq.add(new double[]{gainPR, i});
        }

        while (extraStudents > 0) {
            double[] curr = pq.poll();
            int idx = (int) curr[1];

            classes[idx][0]++;
            classes[idx][1]++;

            int pass = classes[idx][0];
            int total = classes[idx][1];
            double currPR = (double) pass / total;
            double nextPR = (double) (pass + 1) / (total + 1);
            double gainPR = nextPR - currPR;

            pq.add(new double[]{gainPR, idx});
            extraStudents--;
        }

        double res = 0d;
        for (int i = 0; i < n; i++) {
            res += (double) classes[i][0] / classes[i][1];
        }
        return res / n;
    }
}