class Solution {
    fun numOfUnplacedFruits(fruits: IntArray, baskets: IntArray): Int {
        class TreeNode(var value: Int) {
            var left: TreeNode? = null
            var right: TreeNode? = null
        }

        fun buildTree(start: Int, end: Int): TreeNode {
            if (start == end) {
                return TreeNode(baskets[start])
            }
            val node = TreeNode(-1)
            val mid = start + ((end - start) shr 1)
            node.left = buildTree(start, mid)
            node.right = buildTree(mid + 1, end)
            node.value = maxOf(node.left!!.value, node.right!!.value)
            return node
        }

        fun findAndUse(node: TreeNode, target: Int): Int {
            if (target > node.value) return -1
            if (node.left == null && node.right == null) {
                node.value = 0
                return 0
            }
            if (node.left != null && node.left!!.value >= target) {
                val newMax = findAndUse(node.left!!, target)
                node.value = maxOf(newMax, node.right?.value ?: -1)
            } else {
                val newMax = findAndUse(node.right!!, target)
                node.value = maxOf(node.left?.value ?: -1, newMax)
            }
            return node.value
        }

        val root = buildTree(0, baskets.size - 1)
        var remains = 0
        for (fruit in fruits) {
            if (findAndUse(root, fruit) == -1) {
                remains++
            }
        }
        return remains
    }
}