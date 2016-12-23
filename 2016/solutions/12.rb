require_relative 'problem.rb'
require_relative '../common/assembunny.rb'

class Problem12 < Problem
  def initialize
    @interpreter = Assembunny::Interpreter.new
  end

  def part_a
    @interpreter.parse_and_load(self.input)
    @interpreter.execute

    @interpreter.rA
  end

  def part_b
    @interpreter.parse_and_load(self.input)
    @interpreter.rC = 1
    @interpreter.execute

    @interpreter.rA
  end
end