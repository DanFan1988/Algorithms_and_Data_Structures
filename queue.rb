class Queue
	# First In, First Out
	# To avoid resizing problems and O(n) dequeuing, use a linked list
	attr_reader :queue

	alias_method :size, :length

	def initialize(queue = [])
		@queue = queue
	end

	def [](idx)
		@queue[idx]
	end

	def enqueue(item)
		@queue.push(item)
	end

	def dequeue
		raise "Queue is empty" if self.empty?
		@queue.shift
	end

	def length
		@queue.length
	end

	def empty?
		@queue.empty?
	end

	def front
		@queue.first
	end

	def back
		@queue.last
	end
end

Queue.new