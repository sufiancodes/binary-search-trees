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
    return root if root.data == value
    return find(value, root.right) if root.data < value
    find(value, root.left)
  end
  def bfs_iteratively(root)
    return nil if root == nil
    queue = []
    queue.push(root)
    while queue.count != 0 
      front = queue.shift
      queue.push(front.left) if front.left != nil
      queue.push(front.right) if front.right != nil
      p front.data
    end
  end
  def print_nodes_at_level(root, level = 1)
    return if root.nil?
    if level == 1
      puts root.data
    else
    print_nodes_at_level(root.left, level - 1)
    print_nodes_at_level(root.right, level - 1)
    end
  end
  def bfs_recursively(root, height)
    return nil if height == 0
    bfs_recursively(root, height - 1)
    print_nodes_at_level(root, height)
  end
  def preorder(root)
    return if root.nil?
    puts root.data
    preorder(root.left)
    preorder(root.right)
  end
  def inorder(root)
    return if root.nil?
    inorder(root.left)
    puts root.data
    inorder(root.right)
  end
  def postorder(root)
    return if root.nil?
    postorder(root.left)
    postorder(root.right)
    puts root.data
  end
  def height(root, value)
    element = find(value, root)
    height_recursively(element, 0)
  end
  def height_recursively(root, height = 0)
    return height if root.nil?
    left_subtree = height_recursively(root.left, height+1)
    right_subtree = height_recursively(root.right, height+1)
    result = [left_subtree, right_subtree]
  end
end

bst = Tree.new(arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
roo = bst.build_tree([1,2,3,4,5,6,7,8], 0, 7)

bst.pretty_print(roo)
# bst.preorder(roo)
# bst.inorder(roo)
# p bst.height(roo, 6)
a = bst.height(roo, 6)
p a