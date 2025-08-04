type Fruit = number
type Index = number
type Position = [Fruit, Index]

function totalFruit(fruits: number[]): number {
    let count = 0
    const n = fruits.length
    let a: Position = [fruits[0], 0] // first fruit and index of its first appearence
    let b: Position = [-1, 0] // second fruit (we don't know it yet)
    let last: Position = [fruits[0], 0] // the last fruit, that we have met
    for (let i = 1; i < n; i++) {
        if (b[0] == -1) {
            if (fruits[i] !== a[0]) {
                b = [fruits[i], i]
                last = [fruits[i], i]
            }
        } else if (fruits[i] == a[0] || fruits[i] == b[0]) {
            if (last[0] != fruits[i]) {
                last = [fruits[i], i]
            }
        } else { // here comes the third fruit into the sliding window
            count = Math.max(count, i - Math.min(a[1], b[1]))
            a = last
            b = [fruits[i], i]
            last = [fruits[i], i]
        }
    }
    count = Math.max(count, n - Math.min(a[1], b[1]))
    return count
}