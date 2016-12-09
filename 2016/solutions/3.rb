require_relative 'problem.rb'

class Problem3 < Problem
  def part_a
    valid = 0
    self.input.each_line do |line|
      sides = line.split(' ')
      sides.map! { |s| Integer(s) }
      if valid_triangle? sides[0], sides[1], sides[2]
        valid = valid + 1
      end
    end
    valid
  end

  def part_b
    valid = 0
    all_sides = []
    self.input.each_line do |line|
      sides = line.split(' ')
      sides.map! { |s| Integer(s) }
      all_sides << sides
    end

    (0..(all_sides.size-1)).step(3) do |r|
      (0..2).each do |c|
        if valid_triangle? all_sides[r][c], all_sides[r+1][c], all_sides[r+2][c]
          valid = valid + 1
        end
      end
    end
    valid
  end

  def valid_triangle? (a, b, c)
    ((a + b) > c) && ((a + c) > b) && ((b + c) > a)
  end
end