class Solution:
  def removeAnagrams(self, words: List[str]) -> List[str]:
    res = []
    prev = []

    for i in range(len(words)):
      word = words[i]
      counter = [0]*26
      for c in word:
        counter[ord(c)-ord('a')] += 1

      if counter != prev:
        res.append(word)
        prev = counter
    return res