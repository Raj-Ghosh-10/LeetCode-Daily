class Solution {
  func reorderedPowerOf2(_ n: Int) -> Bool {
    // step 1: make biggest value
    let chars: [Character] = Array("\(n)")
    var lowest = chars.sorted()
    let biggest = lowest.reversed()
    let b = Int(String(biggest)) ?? 0

  
    // step 2: make lowest value without leading zeros
    lowest = lowest.sorted(by: { ch1, ch2 in
      if ch1 == "0" {
        return false
      } else if ch2 == "0" {
        return true
      } else {
        return ch1 < ch2
      }
    })
    let l = Int(String(lowest)) ?? 0

    // step 3: result to power
    var arr: [(Int, Int)] = []
    var power = 0
    var num = 1
    while(true) { // 29 times
      arr.append((num, power))
      power += 1
      num = num * 2
      if num > 1_000_000_000 {
        break
      }
    }

    // step 4: make range
    var range: [(Int, Int)] = []
    for n in arr {
      if n.0 * 2 >= l && n.0 <= b { // n.0 * 2 will extend the range a little because my "lowes" not actually lowest but close
        range.append(n)
      }
    }

    // step 5: make dictionary with count of chars FOR `n`
    var dictN: [Character: Int] = [:]
    for ch in chars {
      dictN[ch] = (dictN[ch] ?? 0) + 1
    }

    // step 6: make dictionary with count of chars FOR `range` and compare to dictionary FOR `n`
    for r in range {
      var dictR: [Character: Int] = [:]
      let chars: [Character] = Array("\(r.0)")
      for ch in chars {
        dictR[ch] = (dictR[ch] ?? 0) + 1
      }

      var allMatched = true
      for key in dictN.keys {
        if dictN[key] != dictR[key] {
          allMatched = false
          break
        }
      }
      if allMatched == false {
        continue
      }
      for key in dictR.keys {
        if dictN[key] != dictR[key] {
          allMatched = false
          break
        }
      }
      if allMatched {
        return true
      }
    }

    return false
  }
}