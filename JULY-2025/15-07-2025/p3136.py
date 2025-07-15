class Solution:
    def isValid(self, word: str) -> bool:
        lowercaseWord = word.lower()

        # check length of word
        if len(lowercaseWord) < 3:
            return False

        # check that 
        hasVowel = False
        hasCons = False

        for w in lowercaseWord:
            if not self.isAlpha(w) and not self.isNumeric(w):
                return False

            if self.isAlpha(w):
                if self.isVowel(w):
                    hasVowel = True
                else:
                    hasCons = True
        
        return hasVowel and hasCons


    def isAlpha(self, char):
        # lowerChar = char.lower()
        return ord("a") <= ord(char) <= ord("z")
    
    def isNumeric(self, char):
        # lowerChar = char.lower()
        return ord("0") <= ord(char) <= ord("9")
    
    def isVowel(self, char):
        # lowerChar = char.lower()
        mp = set(("a", "e", "i", "o", "u"))
        if char in mp:
            return True
        return False
        