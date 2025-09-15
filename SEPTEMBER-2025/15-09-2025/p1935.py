class Solution(object):
    def canBeTypedWords(self, text, brokenLetters):
        """
        :type text: str
        :type brokenLetters: str
        :rtype: int
        """
        res=0
        broken=set(brokenLetters)
        for word in text.split():
            if all(char not in broken for char in word):
                res+=1
        return res