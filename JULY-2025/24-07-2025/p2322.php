class Solution {
    private $nums;
    private $adjacencyList;
    private $totalXor;
    private $result;

    /**
     * @param Integer[] $nums
     * @param Integer[][] $edges
     * @return Integer
     */
    function minimumScore($nums, $edges) {
        // Calculate the total XOR of all node values
        $this->totalXor = 0;
        foreach ($nums as $num) {
            $this->totalXor ^= $num;
        }
        
        $this->nums = $nums;
        
        // Create an adjacency list for the tree
        $this->adjacencyList = [];
        foreach ($edges as $edge) {
            $u = $edge[0];
            $v = $edge[1];
            if (!isset($this->adjacencyList[$u])) {
                $this->adjacencyList[$u] = [];
            }
            if (!isset($this->adjacencyList[$v])) {
                $this->adjacencyList[$v] = [];
            }
            $this->adjacencyList[$u][] = $v;
            $this->adjacencyList[$v][] = $u;
        }
        
        $this->result = PHP_INT_MAX;
        
        // Start DFS from the root node (0) with no parent (-1) and an empty array of other XORs
        $this->dfs(0, -1, []);
        
        return $this->result;
    }

    /**
     * Perform DFS to calculate XOR values of subtrees
     */
    private function dfs($currentNode, $parentNode, $otherXors) {
        // To store the XOR values of subtrees
        $subtreeXors = [];
        // Start with the current node's value
        $currentXor = $this->nums[$currentNode];
        
        foreach ($this->adjacencyList[$currentNode] as $neighbor) {
            // Avoid going back to the parent
            if ($neighbor != $parentNode) {
                list($subtreeValue, $childrenXors) = $this->dfs($neighbor, $currentNode, array_merge($otherXors, $subtreeXors));
                // Combine the child subtree XORs
                $subtreeXors = array_unique(array_merge($subtreeXors, $childrenXors));
                // XOR with the child's value
                $currentXor ^= $subtreeValue;
            }
        }
        
        // Calculate scores with the XOR values from other components
        foreach ($otherXors as $other) {
            $this->result = min($this->result, $this->calculate_score($currentXor, $other, $this->totalXor ^ $currentXor ^ $other));
        }
        
        // If the current node has a parent, calculate scores with its subtree
        if ($parentNode != -1) {
            foreach ($subtreeXors as $childXor) {
                $this->result = min($this->result, $this->calculate_score($currentXor ^ $childXor, $this->totalXor ^ $currentXor, $childXor));
            }
        }
        
        // Add the current node's XOR to the subtree array
        $subtreeXors[] = $currentXor;
        $subtreeXors = array_unique($subtreeXors);
        
        // Return the current XOR and the array of subtree XORs
        return [$currentXor, $subtreeXors];
    }
    
    /**
     * Calculate the score difference between the largest and smallest XOR values
     */
    private function calculate_score($a, $b, $c) {
        return max($a, $b, $c) - min($a, $b, $c);
    }
}