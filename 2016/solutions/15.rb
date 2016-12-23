require_relative 'problem.rb'

class Disc
  def initialize(num_positions, current_position)
    @num_positions = num_positions
    @current_position = current_position % num_positions
  end

  def rotate
    @current_position = (@current_position + 1) % @num_positions
  end

  def open?
    @current_position == 0
  end

  def to_s
    "{num_pos=#{@num_positions}, pos=#{@current_position}, open=#{open?}}"
  end
end

class Problem15 < Problem
  def part_a
    discs = build_discs
    rotate_until_open(discs)
  end

  def part_b
    discs = build_discs
    discs << Disc.new(11, discs.size + 1)
    rotate_until_open(discs)
  end

  def build_discs
    discs = Array.new
    self.input.each_line do |line|
      line.strip!
      if /Disc #(?<disc_num>\d+) has (?<disc_positions>\d+) positions; at time=0, it is at position (?<disc_init_position>\d+)./ =~ line
        disc_num = Integer(disc_num)
        disc_positions = Integer(disc_positions)
        disc_init_position = Integer(disc_init_position)

        discs[disc_num-1] = Disc.new(disc_positions, disc_init_position + disc_num)
      else
        raise "Illegal instruction: '#{line}'"
      end
    end
    discs
  end

  def rotate_until_open(discs)
    i = 0
    until discs.count { |disc| !disc.open? } == 0
      discs.each { |v| v.rotate }
      # p discs
      i += 1
    end

    i
  end
end