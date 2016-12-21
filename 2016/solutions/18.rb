require_relative 'problem.rb'

class Problem18 < Problem
  def initialize(first_row, num_of_rows)
    @first_row = first_row
    @num_of_rows = num_of_rows
  end

  def print_traps_map(traps_map)
    traps_map.each do |r|
      r.each { |c| print "#{c ? '^' : '.'}"}
      puts
    end
  end

  def part_a
    solve_two_rows
  end

  def part_b
    solve_two_rows
  end

  def solve_build_entire_map
    traps_map  = Array.new
    traps_map << @first_row.split('').map do |v|
      if (v == '.')
        false
      elsif (v == '^')
        true
      else
        raise "Unexpected symbol: #{v}"
      end
    end

    num_of_columns = @first_row.size
    (1..(@num_of_rows-1)).each do |i|
      prev_row = traps_map[i-1]
      new_row = Array.new(@first_row.size)

      (0..num_of_columns-1).each do |j|
        new_row[j] = if j>0 && j < (num_of_columns-1)
                       ((prev_row[j-1] && !prev_row[j+1])) || ((prev_row[j+1] && !prev_row[j-1]))
                     elsif j==0
                       prev_row[j+1]
                     elsif j==num_of_columns-1
                       prev_row[j-1]
                     end
      end

      traps_map << new_row
    end

    print_traps_map(traps_map)
    traps_map.map{ |n| n.count(false) }.reduce(:+)
  end

  def solve_two_rows
    current_row = @first_row.split('').map do |v|
      if (v == '.')
        false
      elsif (v == '^')
        true
      else
        raise "Unexpected symbol: #{v}"
      end
    end

    num_of_columns = @first_row.size
    num_of_safe = current_row.count(false)

    (@num_of_rows-1).times do
      pref_left = false
      (0..num_of_columns-1).each do |j|
        prev_value = current_row[j]
        current_row[j] = if j==num_of_columns-1
                            pref_left
                         else
                            ((pref_left && !current_row[j+1])) || ((current_row[j+1] && !pref_left))
                         end
        pref_left = prev_value
      end

      num_of_safe += current_row.count(false)
    end

    num_of_safe
  end
end