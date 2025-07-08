object Solution {
    def maxValue(events: Array[Array[Int]], k: Int): Int =
      loop(events.sorted(Ordering.by((e:Array[Int])=>(e(0), e(1)))), 0, k, 0, Array.ofDim[Int](k+1, events.length))

    def loop(events: Array[Array[Int]], index: Int, remainingEvents: Int, lastEventEndDay: Int, dp: Array[Array[Int]]): Int = 
      if (index >= events.length || remainingEvents == 0) 0
      else if (lastEventEndDay >= events(index)(0)) loop(events, index+1, remainingEvents, lastEventEndDay, dp)
      else if (dp(remainingEvents)(index) != 0) dp(remainingEvents)(index)
      else {
        dp(remainingEvents)(index) = math.max(
          loop(events, index+1, remainingEvents, lastEventEndDay, dp),
          loop(events, index+1, remainingEvents-1, events(index)(1), dp) + events(index)(2)
        )
        dp(remainingEvents)(index)
      }
}