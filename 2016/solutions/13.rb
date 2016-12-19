require_relative 'problem.rb'

class Problem13 < Problem
  def initialize(favorite_number, final_x, final_y)
    @favorite_number = favorite_number
    @final_x = final_x
    @final_y = final_y
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

  def part_a
    room_matrix = Array.new(50) { Array.new(50) {nil} }

    (0..room_matrix.size-1).each do |x|
      (0..room_matrix[0].size-1).each do |y|
        room_matrix[y][x] = is_there_wall(@favorite_number, x, y)
      end
    end

    puts 'Printing grid...'
    printRoom(room_matrix)

    adgacency_matrix = Array.new(50) { Array.new(50) { nil }}
    # Generate adjacency matrix
  end

  def part_b
    self.input.each_line do |line|
      # Process input here
    end
  end
end