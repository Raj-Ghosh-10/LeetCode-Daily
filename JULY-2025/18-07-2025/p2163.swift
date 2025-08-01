class Solution {
    func minimumDifference(_ nums: [Int]) -> Int {
        let n = nums.count / 3
        var leftSum = 0
        var leftHeap = Heap<Int>(with: >)
        var leftPrefix = [Int](repeating: 0, count: n + 1)

        for i in 0..<(2 * n) {
            leftHeap.insert(nums[i])
            leftSum += nums[i]

            if leftHeap.size > n {
                leftSum -= leftHeap.poll()!
            }

            if i >= n - 1 {
                leftPrefix[i - (n - 1)] = leftSum
            }
        }

        var rightSum = 0
        var rightHeap = Heap<Int>(with: <)
        var rightPrefix = [Int](repeating: 0, count: n + 1)

        for i in stride(from: nums.count - 1, through: n, by: -1) {
            rightHeap.insert(nums[i])
            rightSum += nums[i]

            if rightHeap.size > n {
                rightSum -= rightHeap.poll()!
            }

            if i <= 2 * n {
                rightPrefix[i - n] = rightSum
            }
        }

        var result = Int.max
        for i in 0...n {
            result = min(result, leftPrefix[i] - rightPrefix[i])
        }

        return result
    }
}

public final class Heap<T>: CustomStringConvertible {
    public typealias Comparator = (T, T) -> Bool
    
    private var elements = [T]()
    private let comparator: Comparator
    
    // MARK: - Init
    
    public init(with comparator: @escaping Comparator) {
        self.comparator = comparator
    }
    
    /// Build heap filled with `array` data
    /// https://en.wikipedia.org/wiki/Binary_heap#Building_a_heap
    /// - Parameters:
    ///   - array: input data
    ///   - comparator: defines the order in heap
    /// - Complexity: `O(n)`
    public init(from array: [T], with comparator: @escaping Comparator) {
        self.elements = array
        self.comparator = comparator
        
        (0..<(array.count / 2)).reversed().forEach { i in
            sift(down: i)
        }
    }
    
    // MARK: - Public Get Properties
    
    /// The top element
    /// - Complexity: `O(1)`
    public var root: T? { elements.first }
    public var isEmpty: Bool { elements.isEmpty }
    public var size: Int { elements.count }
    
    // MARK: - Public Methods
    
    /// Extract the top element of the heap
    /// - Returns: top element if exists, `nil` otherwise
    /// - Complexity: `O(log(n))`
    @discardableResult public func poll() -> T? {
        guard !isEmpty else { return nil }
        
        let pollingElement = elements[0]
        
        elements[0] = elements[size - 1]
        elements.removeLast()
        
        sift(down: 0)
        
        return pollingElement
    }
    
    /// Inserts the element to the heap
    /// - Parameter element: data
    /// - Complexity: `O(log(n))`
    public func insert(_ element: T) {
        elements.append(element)
        sift(up: size - 1)
    }
    
    
    // MARK: - Private Methods
    
    private func sift(up index: Int) {
        var i = index
        
        while comparator(elements[i], elements[(i - 1) / 2]) {
            elements.swapAt(i, (i - 1) / 2)
            i = (i - 1) / 2
        }
    }
    
    private func sift(down index: Int) {
        var i = index
        
        while 2 * i + 1 < size {
            let left = 2 * i + 1
            let right = 2 * i + 2
            
            var j = left
            if right < size, comparator(elements[right], elements[left]) {
                j = right
            }
            if comparator(elements[i], elements[j]) {
                break
            }
            
            elements.swapAt(i, j)
            i = j
        }
    }
    
    public var description: String {
        "\(elements)"
    }
}