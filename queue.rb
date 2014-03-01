class Queue
	attr_reader :queue

	alias_method :size, :length

	def initialize(queue = [])
		@queue = queue
	end

	def enqueue(item)
		@queue.push(item)
	end

	def dequeue
		@queue.shift
	end

	def length
		@queue.length
	end

	def empty?
		@queue.empty?
	end
end