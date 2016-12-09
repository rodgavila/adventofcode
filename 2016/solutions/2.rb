require_relative 'problem.rb'
# require 'hash'
#     1
#   2 3 4
# 5 6 7 8 9
#   A B C
#     D
class Problem2 < Problem
  def initialize
    # Contains a map of current key to an array of final key (U, D, L, R)
    @keypad = Hash.new
    @keypad['1'] = %w(1 3 1 1)
    @keypad['2'] = %w(2 6 2 3)
    @keypad['3'] = %w(1 7 2 4)
    @keypad['4'] = %w(4 8 3 4)
    @keypad['5'] = %w(5 5 5 6)
    @keypad['6'] = %w(2 A 5 7)
    @keypad['7'] = %w(3 B 6 8)
    @keypad['8'] = %w(4 C 7 9)
    @keypad['9'] = %w(9 9 8 9)
    @keypad['A'] = %w(6 A A B)
    @keypad['B'] = %w(7 D A C)
    @keypad['C'] = %w(8 C B C)
    @keypad['D'] = %w(B D D D)
  end

  def part_a
    code = ''
    current = 5
    self.input.each_line do |line|
      line.each_char do |c|
        case c
          when 'U'
            if not [1, 2, 3].include? current
              current = current - 3
            end
          when 'D'
            if not [7, 8, 9].include? current
              current = current + 3
            end
          when 'L'
            if not [1, 4, 7].include? current
              current = current - 1
            end
          when 'R'
            if not [3, 6, 9].include? current
              current = current + 1
            end
        end
      end
      code = "#{code}#{current}"
    end
    code
  end

  def part_b
    code = ''
    current = '5'
    self.input.each_line do |line|
      line.each_char do |c|
        case c
          when 'U'
            current = @keypad[current][0]
          when 'D'
            current = @keypad[current][1]
          when 'L'
            current = @keypad[current][2]
          when 'R'
            current = @keypad[current][3]
        end
      end
      code = "#{code}#{current}"
    end
    code
  end
end