require_relative 'problem.rb'

class Problem23 < Problem
  attr_accessor :interpreter

  def initialize
    @interpreter = Assembunny::Interpreter.new
  end

  def part_a
    @interpreter.parse_and_load(self.input)
    @interpreter.execute

    @interpreter.rA
  end

  def part_b
    self.input.each_line do |line|
      # Process input here
    end
  end
end