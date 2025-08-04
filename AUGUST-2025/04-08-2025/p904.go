func totalFruit(fruits []int) int {
    
    last, secondLast := -1, -1
    lastCount, curr , maxFruits := 0, 0, 0

    for _, fruit := range fruits {
        if fruit == last || fruit == secondLast {
            curr++
        }else{
            curr = lastCount + 1
        }

        if fruit == last {
            lastCount++
        }else{
            lastCount = 1
            secondLast = last
            last = fruit
        }
        if curr > maxFruits {
            maxFruits = curr
        }
    }

    return maxFruits
}