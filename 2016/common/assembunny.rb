
module Assembunny
  class Instruction
    attr_accessor :opcode, :p0, :p1

    def initialize (opcode, p0=nil, p1=nil)
      @opcode = opcode
      @p0 = p0
      @p1 = p1
      @ip = 0
    end
  end

  class Interpreter
    attr_accessor :debug
    def initialize
      @debug = false
      @instructions = nil
      @r = [0, 0, 0, 0]

      @toggle_map = Hash.new
      @toggle_map[0] = 6
      @toggle_map[1] = 7
      @toggle_map[2] = 3
      @toggle_map[3] = 2
      @toggle_map[4] = -4
      @toggle_map[5] = -5
      @toggle_map[6] = 0
      @toggle_map[7] = 1
      @toggle_map[8] = 2
      @toggle_map[-4] = 4
      @toggle_map[-5] = 5
      @toggle_map[10] = 10
    end

    def parse_and_load(input)
      @instructions = Array.new

      input.each_line do |line|
        line.strip!
        if /\Acpy (?<x>-?\d+) (?<y>[[:lower:]]+)\Z/ =~ line
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
        elsif /\Ajnz (?<x>-?\d+) (?<y>[[:lower:]]+)\Z/ =~ line
          @instructions << Instruction.new(6, Integer(x), ratoi(y))
        elsif /\Ajnz (?<x>[[:lower:]]+) (?<y>[[:lower:]]+)\Z/ =~ line
          @instructions << Instruction.new(7, Integer(x), ratoi(y))
        elsif /\Atgl (?<x>[[:lower:]]+)\Z/ =~ line
          @instructions << Instruction.new(8, ratoi(x))
        elsif /\Ainc (?<x>[[:lower:]]+) (?<y>[[:lower:]]+)\Z/ =~ line
          @instructions << Instruction.new(9, ratoi(x), ratoi(y))
        elsif /\Anop\Z/ =~ line
          @instructions << Instruction.new(10)
        elsif /\Amul (?<x>[[:lower:]]+) (?<y>[[:lower:]]+)\Z/ =~ line
          @instructions << Instruction.new(11, ratoi(x), ratoi(y))
        else
          raise "No match for #{line}"
        end
      end
    end

    def execute()
      @ip = 0
      while @ip < @instructions.size
        ins = @instructions[@ip]
        if @debug; puts "Executing #{@ip}: #{ins.opcode}, ra=#{rA}, rb=#{rB}, rc=#{rC}, rd=#{rD}"; end
        @ip += 1

        # Illegal instructions yield by toggle, just no-op
        if ins.opcode < 0
          next
        end

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
              @ip += ins.p1 - 1
            end
          when 5
            unless @r[ins.p0] == 0
              @ip += ins.p1 - 1
            end
          when 6
            unless [ins.p0] == 0
              @ip += @r[ins.p1] - 1
            end
          when 7
            unless @r[ins.p0] == 0
              @ip += @r[ins.p1] - 1
            end
          when 8
            tgl(@ip - 1 + @r[ins.p0])
          when 9
            @r[ins.p0] += @r[ins.p1]
          when 10
            # No-op
          when 11
            @r[ins.p0] *= @r[ins.p1]
          else
            raise "Unexpected opcode #{ins.opcode}"
        end
        # puts "ip: #{ip}"
      end
    end

    def tgl(address)
      if (address >= 0 && address < @instructions.size)
        if @toggle_map[@instructions[address].opcode].nil?
          raise "Trying to toggle untoggable operation (#{@instructions[address].opcode}) at address #{address}"
        else
          if @debug; puts "Toggled instruction #{@instructions[address].opcode} at #{address}"; end
          @instructions[address].opcode = @toggle_map[@instructions[address].opcode]
        end
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