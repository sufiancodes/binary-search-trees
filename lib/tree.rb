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
    return Node.new(value) if root == nil
    return root if root.data == value
    root.data > value ? root.left = insert(value, root.left) : root.right = insert(value, root.right)
    return root
  end
  def get_successor(root)
    current = root.right
    while current != nil && current.left != nil
      current = current.left
    end
    return current
  end
  def delete (root, value)
    return root if root.nil?
    if root.data > value
      root.left = delete(root.left, value)
    elsif root.data < value
      root.right = delete(root.right, value)
    else
      return root.left if root.right.nil?
      return root.right if root.left.nil?
    suc = get_successor(root)
    root.data = suc.data
    root.right = delete(root.right, suc.data)
    end
    return root
  end
  def find(value, root)
    return root if root.nil?
    if root.data == value
      return root
    elsif root.data < value
      root.left = find(value, root.right)
    else
      root.right = find(value, root.left)
    end
  end
end

bst = Tree.new(arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
roo = bst.build_tree([1,2,3,4,5], 0, 4)
bst.pretty_print(roo)
ccc = bst.find(1,roo)
p ccc