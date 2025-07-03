func kthCharacter(k int) byte {
	return 'a' + byte(bits.OnesCount(uint(k-1))%26)
}

func kthCharacter2(k int) byte {
	shift := 0
	len := bits.Len(uint(k))
	msb := 1 << (len - 1)

	for k > msb {
		k -= msb
		shift++
		len = bits.Len(uint(k))
		msb = 1 << (len - 1)
	}
	shift = (shift + len - 1) % 26
	return 'a' + byte(shift)
}