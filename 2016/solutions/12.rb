require_relative 'problem.rb'

class Instruction
  attr_accessor :opcode, :p0, :p1

  def initialize (opcode, p0, p1=nil)
    @opcode = opcode
    @p0 = p0
    @p1 = p1
  end
end

class Problem12 < Problem
  def initialize
    @r = [0, 0, 0, 0]
  end

  def ratoi(r)
    case r
      when 'a'
        return 0
      when 'b'
        return 1
      when 'c'
        return 2
      when 'd'
        return 3
      else
        raise "Invalid register: #{r}"
    end
  end

  def part_a
    instructions = Array.new

    self.input.each_line do |line|
      line.strip!
      if /\Acpy (?<x>\d+) (?<y>[[:lower:]]+)\Z/ =~ line
        instructions << Instruction.new(0, Integer(x), ratoi(y))
      elsif /\Acpy (?<x>[[:lower:]]+) (?<y>[[:lower:]]+)\Z/ =~ line
        instructions << Instruction.new(1, ratoi(x), ratoi(y))
      elsif /\Ainc (?<x>[[:lower:]]+)\Z/ =~ line
        instructions << Instruction.new(2, ratoi(x))
      elsif /\Adec (?<x>[[:lower:]]+)\Z/ =~ line
        instructions << Instruction.new(3, ratoi(x))
      elsif /\Ajnz (?<x>\d+) (?<y>\d+)\Z/ =~ line
        instructions << Instruction.new(4, Integer(x), Integer(y))
      elsif /\Ajnz (?<x>[[:lower:]]+) (?<y>-?\d+)\Z/ =~ line
        instructions << Instruction.new(5, ratoi(x), Integer(y))
      else
        puts "No match for #{line}"
      end
    end

    # Execute
    ip = 0
    while ip < instructions.size
      ins = instructions[ip]
      # puts "Executing #{ip}: #{ins.opcode}, ra=#{r['a']}, rb=#{r['b']}, rc=#{r['c']}, rd=#{r['d']}"
      ip += 1

      case ins.opcode
        when 0
          @r[ins.p1] = ins.p0
        when 1
          @r[ins.p1] = @r[ins.p0]
        when 2
          @r[ins.p0] += 1
        when 3
          @r[ins.p0] -= 1
        when 4
          unless ins.p0 == 0
            ip += ins.p1 - 1
          end
        when 5
          unless @r[ins.p0] == 0
            ip += ins.p1 - 1
          end
        else
          puts "Uexpected opcode #{ins.opcode}"
      end
      # puts "ip: #{ip}"
    end
    @r[ratoi('a')]
  end

  def part_b
    @r[ratoi('c')] = 1
    part_a
  end
end