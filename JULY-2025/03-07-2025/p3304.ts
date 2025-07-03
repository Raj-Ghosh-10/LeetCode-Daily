function kthCharacter(k: number): string {
    const asc: number[] = [0];
    while (asc.length < k) {
        const len = asc.length;
        for (let i = 0; i < len && asc.length < k; i++) {
            asc.push((asc[i] + 1) % 26);
        }
    }
    return String.fromCharCode(asc[k - 1] + 'a'.charCodeAt(0));
}