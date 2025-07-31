using System;
using System.Collections.Generic;

public class Solution {
    public int SubarrayBitwiseORs(int[] arr) {
        HashSet<int> result = new HashSet<int>();
        HashSet<int> current = new HashSet<int>();
        
        foreach (int num in arr) {
            HashSet<int> next = new HashSet<int> { num };
            foreach (int prev in current) {
                next.Add(prev | num); // OR with previous results
            }
            current = next;
            foreach (int val in current) {
                result.Add(val); // store unique results
            }
        }

        return result.Count;
    }
}