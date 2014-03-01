class HashSet
	DEFAULT_SIZE = 10
	MAX_LOAD = 0.75

	attr_accessor :buckets, :counter

	def initialize
		self.buckets = Array.new(DEFAULT_SIZE){[]}
		self.counter = 0
	end

	def insert(item)
		if self.include?(item)
			return
		elsif self.at_max?
			self.resize_buckets
		end

		self.bucket_for(item) << item
		self.counter += 1
	end

	def remove(item)
		return unless self.include?(item)

		self.bucket_for(item).delete(item)
		self.counter -= 1
	end

	def include?(item)
		self.bucket_for(item).include?(item)
	end

	def at_max?
		self.counter >= (MAX_LOAD * self.buckets.count)
	end

	def bucket_for (item, buckets = self.buckets)
		buckets[self.hash(item) % buckets.count]
	end

	def hash(item)
		item.hash
	end

	def resize_buckets
		#double buckets on resize
		resized_buckets = Array.new(self.buckets.count * 2){ [] }

		self.buckets.each do |bucket|
			bucket.each do |item|
				bucket_for(item, new_buckets) << item
			end
		end
		#resizing is O(n) time complexity, but makes insert/delete O(1) average
	end
	
end