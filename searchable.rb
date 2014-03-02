module Searchable
	def dfs(target)
		children.each do |child|
			return child if child.value == target
			child.dfs(target)
		end
		nil
	end

	def bfs
	end
end
