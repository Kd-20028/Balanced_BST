require_relative 'node.rb'

class Tree
   attr_accessor :array, :root

  def initialize(array)
    @array = array.sort.uniq
    @root = build_tree(@array)
  end

  def build_tree(array)
      return nil if array.empty?

      return Node.new(array[0]) if array.length <= 1
      middle = (array.length / 2)
      root = Node.new(array[middle])
      root.left = build_tree(array[0...middle])
      root.right = build_tree(array[(middle + 1)..-1])

      return root
  end


  def insert(value, node = root)
    return nil if value == node.data
    if value < node.data
      node.left.nil? ? node.left = Node.new(value) : node.left = insert(value, node.left)
    elsif value > node.data
      node.right.nil? ? node.right = Node.new(value) : node.right = insert(value, node.right)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

tree1 = Tree.new([10, 12, 1, 4, 5, 2, 24, 11, 10, 8])
puts tree1.pretty_print
tree1.insert(16)
puts
puts tree1.pretty_print


