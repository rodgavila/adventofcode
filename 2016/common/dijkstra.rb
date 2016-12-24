require_relative('priority_queue')

class Dijkstra
  INFINITY = 2**32

  def initialize(origin, all_nodes, lambda_distance, lambda_neighbors)
    @origin = origin
    @all_nodes = all_nodes
    @lambda_distance = lambda_distance
    @lambda_neighbors = lambda_neighbors
    @previous = nil
    @distance_to_source = nil
    solve
  end

  def solve
    @distance_to_source = Hash.new()
    @previous = Hash.new

    lambda_comparator = lambda { |x| -@distance_to_source[x]  }
    queue = PriorityQueue.new(lambda_comparator)

    @all_nodes.each do |n|
      @distance_to_source[n] = INFINITY
      @previous[n] = nil
      queue << n
    end
    @distance_to_source[@origin] = 0

    while !queue.empty?
      u = queue.pop
      raise "Unknown node #{u}" unless !@distance_to_source[u].nil?
      @lambda_neighbors.call(u).each do |v|
        raise "Unknown neighbor #{v}" unless !@distance_to_source[v].nil?

        alt = @distance_to_source[u] + @lambda_distance.call(u, v)

        if alt < @distance_to_source[v]
          @distance_to_source[v] = alt
          @previous[v] = u
        end
      end
    end
  end

  def get_shortest_path_to(target)
    if @previous[target].nil?
      return nil
    else
      path = Array.new

      v = target
      path << v
      while v != @origin
        v = @previous[v]
        path << v
      end

      path.reverse!
      return path
    end
  end

  def get_distance_to(target)
    @distance_to_source[target]
  end

  def get_count
    @all_nodes.size
  end
end