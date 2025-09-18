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
  def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
  def insert(value, root)
    retrun Node(value) if root == nil
    return root if root == value
    if root.data > value
      root.left = insert(value, root)
    else
      root.right = insert(value, root )
    end
    return root
  end  
end

bst = Tree.new(arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
roo = bst.build_tree([1,2,3,4,5], 0, 4)
bst.pretty_print(roo)
hey = bst.insert(6, roo)
bst.pretty_print(hey)