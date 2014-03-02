module Searchable
	def dfs(target)
		return self if self.value == target
		children.each do |child|
			child.dfs(target)
			return child if child.value == target
		end
		nil
	end

	def bfs(target)
		queue = [self]
		until queue.empty?
			here = queue.shift
			return here if here.value == target
			queue.concat(here.children)
		end
		nil
	end
end
