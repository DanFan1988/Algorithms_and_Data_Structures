def quick_sort(array)
	return array if array.length <= 1
	pivot = array.pop
	less, more = array.partition { |el| el < pivot }
	quicksort(less) + [pivot] + quicksort(more)
end