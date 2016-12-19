require_relative 'problem.rb'

class Elf
  attr_accessor :presents, :elf_to_steal_from


  def initialize
    @id = -1
    @presents = 1
    @elf_to_steal_from = -1
  end
end

class Problem19 < Problem
  def part_a
    num_of_elves = Integer(self.input)
    circle_of_elves = Array.new(num_of_elves) { Elf.new }

    circle_of_elves.each_with_index do |v, i|
      v.id = i
      v.elf_to_steal_from = (i + 1) % num_of_elves
    end

    i = 0
    while i != circle_of_elves[i].elf_to_steal_from
      etr = circle_of_elves[i].elf_to_steal_from
      circle_of_elves[i].presents = circle_of_elves[etr].presents
      circle_of_elves[etr].presents = 0

      circle_of_elves[i].elf_to_steal_from = circle_of_elves[etr].elf_to_steal_from
      # circle_of_elves[etr] = nil

      i = etr
    end
    i + 1
  end

  def part_b
    num_of_elves = Integer(self.input)
    circle_of_elves = Array.new(num_of_elves) { Elf.new }

    circle_of_elves.each_with_index do |v, i|
      v.id = i
      # v.elf_to_steal_from = (i + (num_of_elves / 2).floor) % num_of_elves
    end

    i = 0
    while i != circle_of_elves[i].elf_to_steal_from
      etr = circle_of_elves[i].elf_to_steal_from
      circle_of_elves[i].presents = circle_of_elves[etr].presents
      circle_of_elves[etr].presents = 0

      circle_of_elves[i].elf_to_steal_from = circle_of_elves[etr].elf_to_steal_from
      # circle_of_elves[etr] = nil

      i = etr
    end
    i + 1
  end
end