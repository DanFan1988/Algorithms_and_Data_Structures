class Link
	attr_accessor :value, :next
	def initialize(value, next_link = nil)
		@value = value
		@next = next_link
	end
end

class SinglelyLinkedList
	attr_accessor :head, :length

	def initialize(head, *values)
		@head = Link.new(head)
		@length = values.length + 1
		self._setUp
	end

	def push(value)
		node 
	end
end

a = LinkedList.new()

puts a.length

