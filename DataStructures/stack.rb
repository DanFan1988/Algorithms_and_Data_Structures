class Stack
	#First In, Last Out
	attr_reader :stack

	def initialize(stack = [])
		@stack = stack
	end

	def [](idx)
		@stack[@stack.length - idx - 1]
	end

	def push(item)
		@stack.push(item)
	end

	def pop
		raise "Stack is empty" if self.empty?
		@stack.pop
	end

	def length
		@stack.length
	end

	alias_method :size, :length

	def empty?
		@stack.empty?
	end

	def top
		@stack.last
	end

	def bottom
		@stack.first
	end
end

a = Stack.new
p a.pop
p a.pop
p a.pop