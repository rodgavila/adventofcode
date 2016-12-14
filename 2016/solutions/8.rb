require_relative 'problem.rb'

class Problem8 < Problem

  def initialize(width, height)
    @width = width;
    @height = height;
    @grid = Array.new(@height) { Array.new(@width) { false } }
  end

  def printGrid()
    @grid.each do | r |
      r.each do | c | 
        print "#{ c ? '#' : '.' }"
      end
      puts "\n"
    end
  end

  def countLit()
    lit = 0
    @grid.each do | r |
      lit += r.select { |c| c }.size
    end
    lit
  end

  def rectangle(width, height)
    @grid[0..(height-1)].each { |r| r.fill(true, 0, width) }
  end

  def rotateColumn(col, shift)
    @grid = @grid.transpose
    rotateRow(col, shift)
    @grid = @grid.transpose
  end

  def rotateRow(row, shift)
    @grid[row].rotate!(-1 * shift)
  end


  def part_a
    self.input.each_line do |line|
      line.strip!

      if /\Arect (?<x>\d+)x(?<y>\d+)\Z/ =~ line
        rectangle(Integer(x), Integer(y))
      elsif /\Arotate column x=(?<x>\d+) by (?<by>\d+)\Z/ =~ line
        rotateColumn(Integer(x), Integer(by))
      elsif /\Arotate row y=(?<y>\d+) by (?<by>\d+)\Z/ =~ line
        rotateRow(Integer(y), Integer(by))
      end
    end
    countLit
  end

  def part_b
    part_a
    printGrid
    true
  end
end