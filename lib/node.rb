require_relative 'comparable'
class Node
  include Comparable
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end