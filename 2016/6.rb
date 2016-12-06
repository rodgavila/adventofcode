require_relative 'problem.rb'

class Problem6 < Problem
  def generate_map_of_columns
    columns = []
    self.input.each_line do |line|
      i = 0
      line.strip.each_char do |c|
        columns[i] ||= Hash.new
        columns[i][c] ||= 0
        columns[i][c] += 1
        i += 1
      end
    end
    columns
  end

  def part_a
    columns = generate_map_of_columns
    message = ''

    columns.each do |col|
      max = col.max_by { |k, v| v }[0]
      message << max
    end

    message
  end

  def part_b
    columns = generate_map_of_columns
    message = ''

    columns.each do |col|
      max = col.min_by { |k, v| v }[0]
      message << max
    end

    message
  end
end