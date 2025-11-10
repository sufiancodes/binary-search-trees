# frozen_string_literal: true

module Comparable
  def compare(node_one, node_two)
    return true if node_one == node_two

    false
  end
end
