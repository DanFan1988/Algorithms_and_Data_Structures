class Link
	attr_accessor :value, :next, :prev
	def initialize(value, prev_link = nil, next_link = nil)
		@value = value
		@prev = prev_link
		@next = next_link
	end
end

class DoublyLinkedList
	attr_accessor :head, :tail

	def initialize(*values)
		@head = nil
		@tail = nil

		values.each do |value|
			self.push(value)
		end
	end

	def [](idx)
		#can handle negative indices
		if idx < 0
			here = @tail
			((idx.abs)-1).times { here = here.prev }
		else
			here = @head
			idx.times { here = here.next }
		end
		here
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

	def unshift(value)
		if self.empty?
			@head = @tail = Link.new(value)
		else
			self.insert_before(@head, value)
		end
	end

	def insert_after(link, value)
		raise "cannot insert after a non-Link Object" unless link.is_a?(Link)

		new_link = Link.new(value)

		if link.next.nil?
			@tail = new_link
		else
			link_after = link.next
			link_after.prev = new_link
			new_link.next = link_after
		end

		link.next = new_link
		new_link.prev = link
	end

	def insert_before(link, value)
		raise "cannot insert before a non-Link Object" unless link.is_a?(Link)

		new_link = Link.new(value)

		if link.prev.nil?
			@head = new_link
		else
			link_before = link.prev
			link_before.next = new_link
			new_link.prev = link_before
		end

		link.prev = new_link
		new_link.next = link
	end

	def remove(link)
		link.prev.next = link.next if link.prev
		link.next.prev = link.prev if link.next

		@head = link.next if link.prev.nil?
		@tail = link.prev if link.next.nil?
	end
end

a = DoublyLinkedList.new(1,2,3)

puts a.head.value, a.tail.value
puts a.remove(a[0])
p a.head.prev

