module Comparable
  def compare(node_one, node_two)
    return true if node_one.data = node_two.data
    return false
  end
end
