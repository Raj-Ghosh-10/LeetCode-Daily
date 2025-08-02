func abs(num int) int {
    if num < 0 {
        return -num
    }
    return num
}

func minCost(basket1 []int, basket2 []int) int64 {
    mp1 := map[int]int{} // basket1 ka freq map
    mp2 := map[int]int{} // basket2 ka freq map
    minValue := int(1e9) // sabse chhota item yaad rakhna for swap optimization

    // basket1 mein har element count karo
    for _, v := range basket1 {
        mp1[v]++
        minValue = min(minValue, v)
    }

    // basket2 mein har element count karo
    for _, v := range basket2 {
        mp2[v]++
        minValue = min(minValue, v)
    }

    var extraToSwap []int // extra elements jo swap hone chahiye

    // Pehle basket1 ke items check karo
    for key, count1 := range mp1 {
        count2 := mp2[key]
        total := count1 + count2

        // Agar total odd hai, to balance possible nahi
        if (total & 1) > 0 {
            return -1
        }

        // Kitne extra items hain jo transfer hone chahiye
        diff := abs(count1 - total/2)

        // Sirf ek taraf ke extras lene hain (half)
        if diff > 0 {
            for i := 0; i < diff; i++ {
                extraToSwap = append(extraToSwap, key)
            }
        }
    }

    // Basket2 mein check karo jo items basket1 mein nahi the
    for key, count2 := range mp2 {
        if _, seen := mp1[key]; seen {
            continue
        }

        // Again odd count ka matlab invalid
        if (count2 & 1) > 0 {
            return -1
        }

        // Half extras lenge
        for i := 0; i < count2/2; i++ {
            extraToSwap = append(extraToSwap, key)
        }
    }

    // Ab extras ko sort kar do (taaki saste waale pehle aayen)
    sort.Ints(extraToSwap)

    res := int64(0)
    n := len(extraToSwap)

    // Sirf half elements pe kaam karna hai (baaki half mirror honge)
    for i := 0; i < n/2; i++ {
        // Ya toh direct item ko use karo, ya double min value (zyada sasta)
        res += int64(min(extraToSwap[i], 2*minValue))
    }

    return res
}