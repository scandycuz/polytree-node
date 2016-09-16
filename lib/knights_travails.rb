require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder

  attr_reader :start_node
  attr_accessor :queue

  def initialize(starting_pos)
    @starting_pos = starting_pos
    @start_node = PolyTreeNode.new(starting_pos)
    @visited_postions = [starting_pos]
  end

  def valid_moves(pos)
    row, col = pos
    moves = []
    (row-2..row+2).each do |new_row|
      # debugger
      if new_row == row-2 || new_row == row+2
        move = [new_row, col+1]
        if valid_move?(move)
          moves << move
        end
        move = [new_row, col-1]
        if valid_move?(move)
          moves << move
        end
      elsif new_row == row-1 || new_row == row+1
        move = [new_row, col+2]
        if valid_move?(move)
          moves << move
        end
        move = [new_row, col-2]
        if valid_move?(move)
          moves << move
        end
      end

    end
    moves
  end

  def valid_move?(pos)
    pos.all? { |coord| coord.between?(0,8) }
  end

  def build_move_tree

    current_node = @start_node
    @queue = [current_node]
    children = add_children(current_node)

    until children.empty?
      @queue << children
      children.each do |child|
        children = add_children(child)

      end
    end



  end

  def add_children(node)
    children = []

    moves = valid_moves(node.value)
    moves.each do |move|
      #p move
      #p @visited_postions
      unless @visited_postions.include?(move)
           children << PolyTreeNode.new(move)
             @visited_postions << move
      end
    end

    children
  end

  def find_path(end_pos)

  end



end

knight = KnightPathFinder.new([0,0])
knight.build_move_tree
p knight.start_node
p knight.start_node.children
