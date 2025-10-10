class Solution {
    public int maximumEnergy(int[] energy, int k) {
        int n = energy.length;
        int[] raj = new int[n];
        int maxEnergy = Integer.MIN_VALUE;

        for (int i = n - 1; i >= 0; i--) {
            if (i + k < n) {
                raj[i] = energy[i] + raj[i + k];
            } else {
                raj[i] = energy[i];
            }
            maxEnergy = Math.max(maxEnergy, raj[i]);
        }

        return maxEnergy;
    }
}