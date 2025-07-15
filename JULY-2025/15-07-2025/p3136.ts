function isValid(word: string): boolean {
    if (word.length < 3) {
        return false
    }

    if (!/^[A-Za-z0-9]+$/.test(word)) {
        return false
    }

    word = word.replace(/[0-9]/g, '').toLowerCase()

    let hasVowel = false
    let hasConsonant = false
    const vowels = ['a', 'e', 'i', 'o', 'u']

    for (let i = 0; i < word.length; i++) {
        const char = word[i]
        if (vowels.includes(char)) {
            hasVowel = true
        } else {
            hasConsonant = true
        }

        if (hasVowel && hasConsonant) return true
    }

    return false
};