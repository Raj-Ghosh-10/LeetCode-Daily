class Solution {
    func kthCharacter(_ k: Int) -> Character {
        var word:[Character] = ["a"]
        var arr = Array("abcdefghijklmnopqrstuvwxyza")
        while word.count <=  k{
            for ch in word {
                if let index = arr.firstIndex(of:ch) {
                    word.append(arr[index + 1])
                }
            }
        }
        return word[k - 1]
    }
}