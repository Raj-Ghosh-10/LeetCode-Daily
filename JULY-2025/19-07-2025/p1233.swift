class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {
        let folders = folder.sorted()
        var result = [folders[0]]
        for folder in folders[1...] {
            let prevFolder = result.last!
            let index = prevFolder.count
            if !folder.hasPrefix(prevFolder) ||
                (folder.count > index && String(folder[folder.index(folder.startIndex, offsetBy: index)]) != "/") {
                result.append(folder)
            }
        }
        return result
    }
}