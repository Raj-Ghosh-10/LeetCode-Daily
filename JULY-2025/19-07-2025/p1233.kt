class Solution {
    fun removeSubfolders(folder: Array<String>): List<String> {
        folder.sort()
        val res = mutableListOf<String>()
        res.add(folder[0])
        var prevSlash = folder[0] + '/'

        for (i in 1..<folder.size) {
            if (!folder[i].startsWith(prevSlash)) {
                res.add(folder[i])
                prevSlash = folder[i] + '/'
            }
        }
        return res
    }
}