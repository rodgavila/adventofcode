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

  def part_a
    grid = Array.new(@height) { Array.new(@width) { false }}

    self.input.each_line do |line|
      printGrid

      line.strip!

      if /\Arect (?<x>\d+)x(?<y>\d+)\Z/ =~ line 
        puts x
        puts y
      elsif line.start_with? 'rotate column'
        line = line[14..line.size-1] # x=1 by 1
        puts line
      elsif line.start_with? 'rotate row'
        line = line[11..line.size-1] # x=1 by 1
        puts line
      end
      # Process input here
    end
    false
  end

  def part_b
    self.input.each_line do |line|
      # Process input here
    end
  end
end