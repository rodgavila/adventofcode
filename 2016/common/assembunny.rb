
module Assembunny
  class Instruction
    attr_accessor :opcode, :p0, :p1

    def initialize (opcode, p0, p1=nil)
      @opcode = opcode
      @p0 = p0
      @p1 = p1
    end
  end

  class Interpreter
    def initialize
      @instructions = nil
      @r = [0, 0, 0, 0]
    end

    def parse_and_load(input)
      @instructions = Array.new

      input.each_line do |line|
        line.strip!
        if /\Acpy (?<x>\d+) (?<y>[[:lower:]]+)\Z/ =~ line
          @instructions << Instruction.new(0, Integer(x), ratoi(y))
        elsif /\Acpy (?<x>[[:lower:]]+) (?<y>[[:lower:]]+)\Z/ =~ line
          @instructions << Instruction.new(1, ratoi(x), ratoi(y))
        elsif /\Ainc (?<x>[[:lower:]]+)\Z/ =~ line
          @instructions << Instruction.new(2, ratoi(x))
        elsif /\Adec (?<x>[[:lower:]]+)\Z/ =~ line
          @instructions << Instruction.new(3, ratoi(x))
        elsif /\Ajnz (?<x>\d+) (?<y>\d+)\Z/ =~ line
          @instructions << Instruction.new(4, Integer(x), Integer(y))
        elsif /\Ajnz (?<x>[[:lower:]]+) (?<y>-?\d+)\Z/ =~ line
          @instructions << Instruction.new(5, ratoi(x), Integer(y))
        else
          puts "No match for #{line}"
        end
      end
    end

    def execute()
      ip = 0
      while ip < @instructions.size
        ins = @instructions[ip]
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
    end

    def rA
      @r[0]
    end

    def rA=(value)
      @r[0] = value
    end

    def rB
      @r[1]
    end

    def rB=(value)
      @r[1] = value
    end

    def rC
      @r[2]
    end

    def rC=(value)
      @r[2] = value
    end

    def rD
      @r[3]
    end

    def rD=(value)
      @r[3] = value
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
  end
end