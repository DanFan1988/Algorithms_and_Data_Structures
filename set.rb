class Set
	attr_accessor :set

	def initailize
		@set = {}
	end

	def add(item)
		@set[item] = true
	end

	def remove(item)
		@set.delete(item)
	end

	def subset?(item)
		!!@set[item]
	end

	def merge(items)
		#can handle both Sets or Arrays, but only those
		if items.is_a?(Set)
			items.set.each_key do |item|
				self.add(item)
			end
		elsif items.is_a?(Array)
			items.each do |item|
				self.add(item)
			end
		else
			raise (ArgumentError, "value must be a Set or Array")
		end
	end

	def intersection?(other_set)
		self.set.each_key do |key|
			return true if other_set.set.has_key?(key)
		end
		return false
	end

	def intersection(other_set)
		intersects = []

		self.set.each_key do |key|
			intersects << key if other_set.set.has_key?(key)
		end

		intersects.empty? ? nil : intersects
	end
end
