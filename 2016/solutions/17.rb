require_relative 'problem.rb'


class Problem17 < Problem
  def initialize
    @digest = Digest::MD5.new
  end

  def part_a
    part_a_backtrack(0, 0, self.input)
  end

  def part_a_backtrack(x, y, passcode)
    # puts "We're in #{x}, #{y}, passcode for this room is #{passcode}"

    if x == 3 && y == 3
      return ''
    end

    if (passcode.size > 50)
      return nil
    end

    md5 = @digest.hexdigest passcode

    current_sol = nil
    # Up
    if y > 0 && ('b'..'f').include?(md5[0])
      sol = part_a_backtrack(x, y-1, passcode + 'U')
      if !sol.nil?
        current_sol = 'U' + sol
      end
    end

    # Down
    if y < 3 && ('b'..'f').include?(md5[1])
      sol = part_a_backtrack(x, y+1, passcode + 'D')
      if !sol.nil?
        sol = 'D' + sol
        if current_sol.nil? || sol.size < current_sol.size
          current_sol = sol
        end
      end
    end

    # Left
    if x > 0 && ('b'..'f').include?(md5[2])
      sol = part_a_backtrack(x-1, y, passcode + 'L')
      if !sol.nil?
        sol = 'L' + sol
        if current_sol.nil? || sol.size < current_sol.size
          current_sol = sol
        end
      end
    end

    # Right
    if x < 3 && ('b'..'f').include?(md5[3])
      sol = part_a_backtrack(x+1, y, passcode + 'R')
      if !sol.nil?
        sol = 'R' + sol
        if current_sol.nil? || sol.size < current_sol.size
          current_sol = sol
        end
      end
    end

    if current_sol.nil?
      return nil
    else
      current_sol
    end
  end

  def part_b
    part_b_backtrack(0, 0, self.input).size
  end

  def part_b_backtrack(x, y, passcode)
    # puts "We're in #{x}, #{y}, passcode for this room is #{passcode}"

    if x == 3 && y == 3
      return ''
    end

    if (passcode.size > 1000)
      return nil
    end

    md5 = @digest.hexdigest passcode

    current_sol = nil
    # Up
    if y > 0 && ('b'..'f').include?(md5[0])
      sol = part_b_backtrack(x, y-1, passcode + 'U')
      if !sol.nil?
        current_sol = 'U' + sol
      end
    end

    # Down
    if y < 3 && ('b'..'f').include?(md5[1])
      sol = part_b_backtrack(x, y+1, passcode + 'D')
      if !sol.nil?
        sol = 'D' + sol
        if current_sol.nil? || sol.size > current_sol.size
          current_sol = sol
        end
      end
    end

    # Left
    if x > 0 && ('b'..'f').include?(md5[2])
      sol = part_b_backtrack(x-1, y, passcode + 'L')
      if !sol.nil?
        sol = 'L' + sol
        if current_sol.nil? || sol.size > current_sol.size
          current_sol = sol
        end
      end
    end

    # Right
    if x < 3 && ('b'..'f').include?(md5[3])
      sol = part_b_backtrack(x+1, y, passcode + 'R')
      if !sol.nil?
        sol = 'R' + sol
        if current_sol.nil? || sol.size > current_sol.size
          current_sol = sol
        end
      end
    end

    if current_sol.nil?
      return nil
    else
      current_sol
    end
  end
end