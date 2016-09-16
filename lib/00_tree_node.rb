require 'byebug'

class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value)
    @value = value
    @children = Array.new
    @parent = nil
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise_error unless @children.include?(child_node)
    child_node.parent = nil
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    node.children << self unless node.nil?
  end

  def dfs(target_value)
    #debugger
    self.value and return self if @value == target_value

    @children.each do |child|
      child.dfs(target_value)
    end

    nil
  end

end

node1 = PolyTreeNode.new("node1")
node2 = PolyTreeNode.new("node2")
node3 = PolyTreeNode.new("node3")
