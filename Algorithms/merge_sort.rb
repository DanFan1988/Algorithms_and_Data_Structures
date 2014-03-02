def merge_sort(array)
  return array if array.length <= 1

  midpoint = array.length / 2
  left, right = array.take(midpoint), array.drop(midpoint)

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  merged_array = []
  until left.empty? || right.empty?
    merged_array <<
      ((left.first < right.first) ? (left.shift) : (right.shift))
  end

  merged_array.concat(left).concat(right)
end