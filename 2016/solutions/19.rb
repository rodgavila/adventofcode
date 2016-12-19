require_relative 'problem.rb'

class Elf
  attr_accessor :id, :right_elf

  def initialize
    @id = -1
    @right_elf = -1
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
    num_of_elves = Integer(self.input)
    circle_of_elves = Array.new(num_of_elves) { Elf.new }

    circle_of_elves.each_with_index do |v, i|
      v.id = i
      # v.right_elf = (i + (num_of_elves / 2).floor) % num_of_elves
    end

    i = 0
    while i != circle_of_elves[i].right_elf
      etr = circle_of_elves[i].right_elf
      circle_of_elves[i].presents = circle_of_elves[etr].presents
      circle_of_elves[etr].presents = 0

      circle_of_elves[i].right_elf = circle_of_elves[etr].right_elf
      # circle_of_elves[etr] = nil

      i = etr
    end
    i + 1
  end
end