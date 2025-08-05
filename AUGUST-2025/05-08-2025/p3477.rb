# @param {Integer[]} fruits
# @param {Integer[]} baskets
# @return {Integer}
def num_of_unplaced_fruits(fruits, baskets)
    fruits.size - fruits.count {|f|
        baskets.size.times.any? {|i| ((baskets[i] >= f) ? (baskets.delete_at(i); true) : false) }
    }
end