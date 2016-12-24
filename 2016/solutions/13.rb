require_relative 'problem.rb'
require_relative '../common/dijkstra'

class Problem13 < Problem
  def initialize(favorite_number)
    @favorite_number = favorite_number
    @all_nodes = nil
  end

  def is_there_wall(favorite_number, x, y)
    result = x*x + 3*x + 2*x*y + y + y*y + favorite_number
    bit_count = count_bits(result)
    (bit_count % 2 == 1)
  end

  def count_bits(x)
    b = 0
    while x > 0
      x &= x - 1
      b += 1
    end
    b
  end

  def printRoom(room)
    room.each do | r |
      r.each do | c |
        print "#{ c ? '#' : '.' }"
      end
      puts "\n"
    end
  end

  def part_a(target_x, target_y)
    dijkstra = build_shorted_path
    dijkstra.get_distance_to("#{target_x}-#{target_y}")
  end

  def part_b(max_distance)
    dijkstra = build_shorted_path

    reachable = 0
    @all_nodes.each do |v|
      if dijkstra.get_distance_to(v) <= max_distance
        reachable += 1
      end
    end

    reachable
  end

  def build_shorted_path
    room_matrix = Array.new(50) { Array.new(50) {nil} }
    @all_nodes = Array.new
    (0..room_matrix.size-1).each do |x|
      (0..room_matrix[0].size-1).each do |y|
        room_matrix[y][x] = is_there_wall(@favorite_number, x, y)

        if !room_matrix[y][x]
          @all_nodes << "#{x}-#{y}"
        end
      end
    end

    # puts 'Printing grid...'
    # printRoom(room_matrix)

    adjacency_list = Hash.new

    (0..room_matrix.size-1).each do |x|
      (0..room_matrix[0].size-1).each do |y|
        neighbors = Array.new

        if !room_matrix[y][x]
          if x > 0 && !room_matrix[y][x-1]; neighbors << "#{x-1}-#{y}"; end
          if x < (50-1) && !room_matrix[y][x+1]; neighbors << "#{x+1}-#{y}"; end
          if y > 0 && !room_matrix[y-1][x]; neighbors << "#{x}-#{y-1}"; end
          if y < (50-1) && !room_matrix[y+1][x]; neighbors << "#{x}-#{y+1}"; end
        end

        adjacency_list["#{x}-#{y}"] = neighbors
      end
    end

    adjacency_list.freeze

    lambda_distance = lambda { |u, v| (adjacency_list[u].include? v) ? 1 : INFINITY }
    lambda_neighbors = lambda { |u| adjacency_list[u] }

    Dijkstra.new('1-1', @all_nodes, lambda_distance, lambda_neighbors)
  end
end