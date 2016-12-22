require_relative 'problem.rb'

class Pair
  attr_accessor :nodeA, :nodeB
  def initialize(nodeA, nodeB)
    if nodeA.name == nodeB.name
      raise 'Cannot create a pair of the same node'
    end

    if nodeA.name < nodeB.name
      @nodeA = nodeA
      @nodeB = nodeB
    else
      @nodeA = nodeB
      @nodeB = nodeA
    end

    freeze
  end

  def ==(other)
    @nodeA == other.nodeA && @nodeB == other.nodeB
  end

  def eql?(other)
    self == other
  end

  def hash
    [@nodeA, @nodeB].hash
  end
end

class Node
  attr_accessor :name, :used, :avail

  def initialize(name, used, avail)
    @name = name
    @used = used
    @avail = avail
    freeze
  end

  def ==(other)
    @name == other.name
  end

  def eql?(other)
    self == other
  end

  def hash
    @name.hash
  end
end

class Problem22 < Problem
  def part_a
    all_nodes = Array.new
    self.input.each_line do |line|
      line.strip!
      if line[0] == '/'
        c = line.gsub(/\s+/, ' ').split(' ')
        all_nodes << Node.new(c[0], Integer(c[2].chomp('T')), Integer(c[3].chomp('T')))
      end
    end

    all_nodes_by_avail = all_nodes.clone
    all_nodes.sort_by! { |v| v.used }
    all_nodes_by_avail.sort_by! { |v| -v.avail }

    viable_pairs = Set.new
    all_nodes.each do |node|
      if node.used > 0
        all_nodes_by_avail.each do |node_avail|
          if (node_avail.avail < node.used)
            break
          elsif node != node_avail
            viable_pairs << Pair.new(node, node_avail)
          end
        end
      end
    end

    viable_pairs.size
  end

  def part_b
    self.input.each_line do |line|
      # Process input here
    end
  end
end