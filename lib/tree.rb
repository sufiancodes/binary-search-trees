require_relative 'node'
class Tree
  attr_accessor :root, :arry
  def initialize(array)
    @arry = array
  end
  def build_tree (arr, start, stop)
    array = arr.sort.uniq
    return nil if start > stop
    mid = (start+stop) / 2
    root = Node.new(array[mid])
    root.left = build_tree(array, start, mid-1 )
    root.right = build_tree(array, mid+1, stop)
    return root
  end
end

bst = Tree.new(arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
