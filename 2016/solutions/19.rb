require_relative 'problem.rb'
require 'benchmark'

class Elf
  attr_accessor :id, :right_elf

  def initialize
    @id = -1
    @right_elf = -1
  end

  def to_s
    "Elf ##{@id}"
  end
end

class Problem19 < Problem
  def part_a
    num_of_elves = Integer(self.input)
    circle_of_elves = Array.new(num_of_elves) { Elf.new }

    circle_of_elves.each_with_index do |v, i|
      v.id = i + 1
      v.right_elf = (i + 1) % num_of_elves
    end

    i = 0
    while i != circle_of_elves[i].right_elf
      etr = circle_of_elves[i].right_elf
      circle_of_elves[i].right_elf = circle_of_elves[etr].right_elf
      i = etr
    end

    circle_of_elves[i].id
  end

  def part_b
    solve_part_b_pattern(Integer(self.input))
  end

  def solve_part_b_sim(num_of_elves)
    elves = (1..num_of_elves).to_a

    while elves.size > 1
      target = (elves.size / 2).floor
      elves.delete_at(target)
      elves.rotate!(1)
    end

    elves[0]
  end

  def solve_part_b_pattern(num_of_elves)
    if num_of_elves == 1
      return 1
    end

    i = 1
    p = 0
    while i < num_of_elves
      result = 0
      (3**p).times do
        result += 1
        i+=1

        if i == num_of_elves
          return result
        end
      end

      (3**p).times do
        result += 2
        i+=1

        if i == num_of_elves
          return result
        end
      end
      p += 1
    end
  end
end