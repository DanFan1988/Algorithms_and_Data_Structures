class Link
	attr_accessor :value, :next, :prev
	def initialize(value, prev_link = nil, next_link = nil)
		@value = value
		@prev = prev_link
		@next = next_link
	end
end

class DoublyLinkedList
	attr_accessor :head, :tail :length

	def initialize(*values)
		@head = nil
		@tail = nil

		@length = values.length
		values.each do |value|
			self.push(value)
		end
	end

	def empty?
		@head.nil?
	end

	def push(value)
		if self.empty?
			@head = @tail = Link.new(value)
		else
			self.insert_after(@tail, value)
		end
	end

	def insert_after(link, value)
		raise "cannot insert after a non-Link Object" unless link.is_a?(Link)

		new_link = Link.new(value)
		if link.next.nil?
			new_link.prev = link
			link.next = new_link
		else
			link_after = link.next

			link_after.prev = new_link
			new_link.next = link_after

			link.next = new_link
			new_link.prev = link
		end
	end



end

a = DoublyLinkedList.new

puts a.length, a.head

