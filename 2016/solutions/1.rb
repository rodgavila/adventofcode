require_relative 'problem.rb'
require 'set'

module Direction
  NORTH=0
  EAST=1
  SOUTH=2
  WEST=3
end

class Coord
  attr_accessor :x, :y

  def initialize
    @x = 0
    @y = 0
  end

  def get_distance_from_origin
    @x.abs + @y.abs
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def eql?(other)
    self == other
  end

  def hash
    [x, y].hash
  end

  def to_s
    "(#{x},#{y})"
  end
end

class Problem1 < Problem
  def initialize
    @coord = Coord.new
    @facing = Direction::NORTH
    @breadcrumbs = []
    @breadcrumbs << @coord.clone
  end

  def part_a
    self.input.each_line do |line|
      instructions = line.split(',')
      instructions.each do |inst|
        inst.strip!
        apply_instruction(inst[0], Integer(inst[1..-1]))
      end
    end

    @coord.get_distance_from_origin
  end

  def part_b
    self.input.each_line do |line|
      instructions = line.split(',')
      instructions.each do |inst|
        inst.strip!
        apply_instruction(inst[0], Integer(inst[1..-1]))
      end
    end

    visited = Set.new
    @breadcrumbs.each do |bc|
      if (visited.add? bc).nil?
        return bc.get_distance_from_origin
      end
    end
    nil
  end

  def apply_instruction(direction, steps)
    turn direction
    move steps
  end

  def turn(direction)
    case direction
      when 'L'
        @facing = @facing - 1
      when 'R'
        @facing = @facing + 1
      else
        raise "Unknown direction: #{direction}"
    end

    @facing = @facing % 4
  end

  def move(steps)
    steps.times {
      case @facing
        when Direction::NORTH
          @coord.y = @coord.y + 1
        when Direction::EAST
          @coord.x = @coord.x + 1
        when Direction::SOUTH
          @coord.y = @coord.y - 1
        when Direction::WEST
          @coord.x = @coord.x - 1
        else
          raise "Unknown orientation: #{@facing}"
      end
      @breadcrumbs << @coord.clone
    }
  end

  def print_current_direction
    case @facing
      when NORTH
        puts 'NORTH'
      when EAST
        puts 'EAST'
      when SOUTH
        puts 'SOUTH'
      when WEST
        puts 'WEST'
      else
        puts @facing
        raise "Unknown orientation: #{@facing}"
    end
  end
end