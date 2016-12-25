require_relative 'problem.rb'
require_relative '../common/dijkstra'
require_relative '../common/coord'

class Problem24 < Problem
  def initialize
    @all_nodes = nil
    @adjacency_list = nil
    @lambda_distance = nil
    @lambda_neighbors = nil
    @shortest_paths_between_numbers = nil
    @number_coords = nil
  end

  def part_a
    parse_and_generate_matrix

    backtrack_coords = @number_coords.reject { |c| c == 0 }
    shortest_path = solve_backtrack(0, backtrack_coords)
    shortest_path.size
  end

  def part_b
    parse_and_generate_matrix

    backtrack_coords = @number_coords.reject { |c| c == 0 }
    shortest_path = solve_backtrack_return_to_origin(0, backtrack_coords)
    shortest_path.size
  end

  def parse_and_generate_matrix
    matrix = Array.new
    @number_coords = Hash.new
    y = 0
    self.input.each_line do |line|
      line.strip!
      row = Array.new

      x = 0
      line.split('').each do |c|
        if c == '#'
          row << true
        elsif c == '.'
          row << false
        elsif (0..9).include?(Integer(c))
          row << false
          @number_coords[Integer(c)] = Coord.new(x, y)
        else
          raise "Illegal grid value: #{c}"
        end
        x += 1
      end

      matrix << row
      y += 1
    end

    @number_coords.freeze
    matrix.freeze

    build_shortest_path(matrix)
  end

  def solve_backtrack(num_origin, coords)
    # puts "Solving backtrack for #{num_origin} with coords #{coords.inspect}"
    if coords.empty?
      return Array.new
    end

    shortest_path = nil
    coords.keys.each do |k|
        path_to_k = get_shortest_path(num_origin, k)
      raise "No shortest path from num #{num_origin} to #{k}" unless !path_to_k.nil?

      backtrack_coords = coords.reject { |c| c == k }
      backtrack_path = solve_backtrack(k, backtrack_coords)

      if shortest_path.nil? || (shortest_path.size > (path_to_k.size + backtrack_path.size))
        shortest_path = path_to_k + backtrack_path
      end
    end

    shortest_path
  end

  def solve_backtrack_return_to_origin(num_origin, coords)
    puts "Solving backtrack for #{num_origin} with coords #{coords.inspect}"
    if coords.empty?
      return get_shortest_path(num_origin, 0)
    end

    shortest_path = nil
    coords.keys.each do |k|
      path_to_k = get_shortest_path(num_origin, k)
      raise "No shortest path from num #{num_origin} to #{k}" unless !path_to_k.nil?

      backtrack_coords = coords.reject { |c| c == k }
      backtrack_path = solve_backtrack_return_to_origin(k, backtrack_coords)

      if shortest_path.nil? || (shortest_path.size > (path_to_k.size + backtrack_path.size))
        shortest_path = path_to_k + backtrack_path
      end
    end

    shortest_path
  end

  def get_shortest_path(num_1, num_2)
    if @shortest_paths_between_numbers.nil?
      @shortest_paths_between_numbers = Hash.new
      @number_coords.each do |k1, v1|
        dijkstra = Dijkstra.new(v1.to_s, @all_nodes, @lambda_distance, @lambda_neighbors)
        @number_coords.each do |k2, v2|
          unless k1 == k2
            path = dijkstra.get_shortest_path_to(v2.to_s)
            path.delete_at(0)
            @shortest_paths_between_numbers[[k1, k2]] = path
          end
        end
      end
    end

    @shortest_paths_between_numbers[[num_1, num_2]]
  end

  def build_shortest_path(matrix)
    if @all_nodes.nil?
      @all_nodes = Array.new
      (0..matrix.size-1).each do |y|
        (0..matrix[0].size-1).each do |x|
          if !matrix[y][x]
            @all_nodes << Coord.new(x, y).to_s
          end
        end
      end
    end

    # puts 'Printing grid...'
    # printRoom(matrix)

    if @adjacency_list.nil?
      @adjacency_list = Hash.new

      (0..matrix.size-1).each do |y|
        (0..matrix[0].size-1).each do |x|
          neighbors = Array.new

          if !matrix[y][x]
            if x > 0 && !matrix[y][x-1]; neighbors << Coord.new(x-1, y).to_s; end
            if x < matrix[0].size-1 && !matrix[y][x+1]; neighbors << Coord.new(x+1, y).to_s; end
            if y > 0 && !matrix[y-1][x]; neighbors << Coord.new(x, y-1).to_s; end
            if y < matrix.size-1 && !matrix[y+1][x]; neighbors << Coord.new(x, y+1).to_s; end
          end

          @adjacency_list[Coord.new(x, y).to_s] = neighbors
        end
      end

      @adjacency_list.freeze
    end

    @lambda_distance = lambda { |u, v| (@adjacency_list[u].include? v) ? 1 : INFINITY }
    @lambda_neighbors = lambda { |u| @adjacency_list[u] }
  end


  def printRoom(room)
    room.each do | r |
      r.each do | c |
        print "#{ c ? '#' : '.' }"
      end
      puts "\n"
    end
  end
end