require './searchable.rb'

class TreeNode
	include Searchable

	attr_accessor :parent, :children, :value

	def initialize(value = nil)
		@value = value
		@parent = nil
		@children = []
	end

	def add_child(child)
		@children << child
		child.parent = self
	end

	def remove_child! (child)
		@children.delete(child)
	end

	def child_count
		@children.count
	end

	def is_leaf?
		@children.empty?
	end

	def is_root?
		@parent.nil?
	end

	def descendents
		@children.map { |child| [child, child.descendents] }.flatten
	end
end
