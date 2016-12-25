require_relative 'problem.rb'

class Equipment
  GENERATOR = 1
  MICROCHIP = 2
  def initialize(element, type)
    raise "Element cannot be nil" unless !element.nil?
    raise "Illegal equipment type: #{type}" unless (type == GENERATOR || type == MICROCHIP)

    @element = element
    @type = type
  end

  def to_s
    "{element=#{@element}, type=#{(@type==GENERATOR) ? 'generator' : 'microchip'}}"
  end
end

class Problem11 < Problem
  def part_a
    equipment = parse_equipment
    p equipment
  end

  def part_b
    self.input.each_line do |line|
      # Process input here
    end
  end

  def parse_equipment
    floors = Hash.new
    i = 0
    self.input.each_line do |line|
      line.strip!

      floors[i] = Array.new
      equipment = line.split(/(,|and)/)

      if equipment.size > 0 && equipment[0].index('relevant').nil?
        equipment.each do |e|
          e.strip!
          if /a (?<element>\w+) generator/ =~ e
            floors[i] << Equipment.new(element, Equipment::GENERATOR)
          elsif /a (?<element>\w+)-compatible microchip/ =~ e
            floors[i] << Equipment.new(element, Equipment::MICROCHIP)
          end
        end
      end

      # p floors[i]
      i += 1
    end

    floors
  end
end