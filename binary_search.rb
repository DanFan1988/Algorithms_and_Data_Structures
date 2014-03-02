def binary_search(array, target)
	#takes a sorted array and finds the target in O(n log n) time
	midpoint = array.length/2

	return midpoint if array[midpoint] == target
	return nil if array.length == 0
	
	if target < array[midpoint]
		binary_search(array.take(midpoint), target)
	else
		placeholder = binary_search(array.drop(midpoint + 1), target)
		placeholder.nil? ? nil : (midpoint + 1) + placeholder
	end
end

p binary_search([1,2,3,4,5,6,7,8],7)