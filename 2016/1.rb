require 'Set'

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

class Problem1
	def initialize
		@coord = Coord.new
		@facing = Direction::NORTH
	end

	def self.run
		Problem1.new.partA
		Problem1.new.partB
	end

	def partA
		File.open("./input/1.txt") do |f|
			f.each_line do |line|
				insts = line.split(",")

				insts.each do |inst|
					inst.strip!
					applyInstruction(inst[0], Integer(inst[1..-1]))
				end
			end
		end

		puts "A: #{getDistanceFromOrigin}"
	end

	def partB
		visited = Set.new
		visited.add @coord
		File.open("./input/1.txt") do |f|
			f.each_line do |line|
				insts = line.split(",")

				insts.each do |inst|
					inst.strip!
					applyInstruction(inst[0], Integer(inst[1..-1]))
					if (visited.add(@coord.clone).nil?)
						puts @coord
						puts "B: #{getDistanceFromOrigin}"
						return
					end
				end
			end
		end
	end

	def applyInstruction(direction, steps)
		turn direction

		case @facing
		when Direction::NORTH
			@coord.y = @coord.y + steps
		when Direction::EAST
			@coord.x = @coord.x + steps
		when Direction::SOUTH
			@coord.y = @coord.y - steps
		when Direction::WEST
			@coord.x = @coord.x - steps
		else
			raise "Unknown orientation: #{@facing}"
		end
	end

	def turn(direction)
		case direction
		when "L"
			@facing = @facing - 1
		when "R"
			@facing = @facing + 1
		else
			raise "Unknown direction: #{direction}"
		end

		@facing = @facing % 4
	end

	def getDistanceFromOrigin
		@coord.x.abs + @coord.y.abs
	end

	def printCurrentDirection
		case @facing
		when NORTH
			puts "NORTH"
		when EAST
			puts "EAST"
		when SOUTH
			puts "SOUTH"
		when WEST
			puts "WEST"
		else
			puts @facing
			raise "Unknown orientation: #{@facing}"
		end
	end
end

Problem1.run