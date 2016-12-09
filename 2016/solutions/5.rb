require_relative 'problem.rb'

require 'digest'

class Problem5 < Problem
  def part_a
    door_id = self.input

    md5 = Digest::MD5.new
    i = 0;
    password = ""

    while password.size < 8
      hash = md5.hexdigest "#{door_id}#{i}"
      
      if (hash[0..4] == '00000')
        password << hash[5]
      end
      i = i + 1
    end

    password
  end

  def part_b
    door_id = self.input

    md5 = Digest::MD5.new
    i = 0;
    password = "--------"
    set_bitmap = 0

    while set_bitmap < 255
      hash = md5.hexdigest "#{door_id}#{i}"
      
      if (hash[0..4] == '00000')
        pos = Integer("0x#{hash[5]}")
        if (pos <= 7)
          mask = (1 << (7-pos))
          if (set_bitmap & mask == 0)
            char = hash[6]
            password[pos] = hash[6]
            set_bitmap = set_bitmap | mask
          end
        end
      end
      i = i + 1
    end

    password
  end
end