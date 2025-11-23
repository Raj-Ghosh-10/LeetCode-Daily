func maxSumDivThree(nums []int) int {
    sum := 0

    m1a, m1b := int(^uint(0)>>1), int(^uint(0)>>1)
    m2a, m2b := int(^uint(0)>>1), int(^uint(0)>>1)

    for _, x := range nums {
        sum += x
        r := x % 3

        if r == 1 {
            if x < m1a {
                m1b = m1a
                m1a = x
            } else if x < m1b {
                m1b = x
            }
        } else if r == 2 {
            if x < m2a {
                m2b = m2a
                m2a = x
            } else if x < m2b {
                m2b = x
            }
        }
    }

    rem := sum % 3
    if rem == 0 {
        return sum
    }

    remove := int(^uint(0) >> 1)

    if rem == 1 {
        opt1 := m1a
        opt2 := int(^uint(0) >> 1)
        if m2b < int(^uint(0)>>1) {
            opt2 = m2a + m2b
        }
        if opt1 < opt2 {
            remove = opt1
        } else {
            remove = opt2
        }
    } else {
        opt1 := m2a
        opt2 := int(^uint(0) >> 1)
        if m1b < int(^uint(0)>>1) {
            opt2 = m1a + m1b
        }
        if opt1 < opt2 {
            remove = opt1
        } else {
            remove = opt2
        }
    }

    if remove == int(^uint(0)>>1) {
        return 0
    }
    return sum - remove
}