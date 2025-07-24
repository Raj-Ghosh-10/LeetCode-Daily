data class TreeNode(
    val parent: TreeNode? = null,
    val value: Int,
    val node: Int,
    val children: MutableList<TreeNode> = mutableListOf()
)

class Solution {
    fun minimumScore(nums: IntArray, edges: Array<IntArray>): Int {
        val matrix = hashMapOf<Int, MutableList<Int>>()
        for (edge in edges) {
            matrix[edge[0]] = (matrix[edge[0]] ?: mutableListOf()).also { it.add(edge[1]) }
            matrix[edge[1]] = (matrix[edge[1]] ?: mutableListOf()).also { it.add(edge[0]) }
        }

        val rootableNode = matrix.keys.first { matrix[it]!!.size == 1 }

        fun buildTree(node: Int, parent: TreeNode?, visited: MutableSet<Int>): TreeNode? {
            if (visited.contains(node)) return null
            visited.add(node)

            val treeNode = TreeNode(
                parent = parent,
                value = nums[node],
                node = node
            )

            val children = matrix[node]?.mapNotNull { buildTree(it, treeNode, visited) }.orEmpty()
            treeNode.children.addAll(children)
            
            return treeNode
        }
        val tree = buildTree(rootableNode, null, mutableSetOf())!!

        val xorMemo = hashMapOf<Int, Int>()
        fun buildXorMemo(node: TreeNode): Int {
            if (node.children.isEmpty()) {
                xorMemo[node.node] = node.value
                return xorMemo[node.node]!!
            }

            var memo = node.value
            node.children.forEach { child ->
                memo = memo xor buildXorMemo(child)
            }

            xorMemo[node.node] = memo
            return xorMemo[node.node]!!
        }
        buildXorMemo(tree)

        fun twoComponentXors(res: MutableList<Pair<Int, Int>>, node: TreeNode, rootXor: Int) {
            for (child in node.children) {
                res.add(Pair(rootXor xor xorMemo[child.node]!!, xorMemo[child.node]!!))
            }

            for (child in node.children) {
                twoComponentXors(res, child, rootXor)
            }
        }

        var res = Int.MAX_VALUE
        fun find(node: TreeNode, root: TreeNode) {
            val children = node.children.toList()
            for (child in children) {
                val pairs1 = mutableListOf<Pair<Int, Int>>()
                val pairs2 = mutableListOf<Pair<Int, Int>>()

                node.children.remove(child)
                var ch = child.parent
                while (ch != null) { 
                    xorMemo[ch.node] = (xorMemo[ch.node]!! xor xorMemo[child.node]!!)
                    ch = ch.parent
                }

                twoComponentXors(pairs1, child, xorMemo[child.node]!!)
                twoComponentXors(pairs2, root, xorMemo[root.node]!!)
                //println("pairs for ${node.node} $curr $pairs")

                node.children.add(child)
                ch = child.parent
                while (ch != null) { 
                    xorMemo[ch.node] = (xorMemo[ch.node]!! xor xorMemo[child.node]!!)
                    ch = ch.parent
                }

                var curr = xorMemo[root.node]!! xor xorMemo[child.node]!! // child tree is divided into two
                pairs1.forEach { (num1, num2) ->
                
                    res = minOf(
                        res,
                        maxOf(num1, num2, curr) - minOf(num1, num2, curr)
                    )
                }

                curr = xorMemo[child.node]!! // non child tree (or root) is divided into two
                pairs2.forEach { (num1, num2) ->
                
                    res = minOf(
                        res,
                        maxOf(num1, num2, curr) - minOf(num1, num2, curr)
                    )
                }
            }

            for (child in node.children) {
                find(child, root)
            }
        }
        find(tree, tree)

        return res
    }
}