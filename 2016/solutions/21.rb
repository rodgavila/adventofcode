require_relative 'problem.rb'

class Problem21 < Problem
  def initialize(start_word)
    @start_word = start_word
  end

  def part_a
    scramble_instructions = Array.new
    self.input.each_line do |line|
      scramble_instructions << line.strip
    end

    scramble_password(@start_word, scramble_instructions)
  end

  def part_b
    scramble_instructions = Array.new
    self.input.each_line do |line|
      scramble_instructions << line.strip
    end

    password_map = Hash.new

    @start_word.split('').permutation do |p|
      password = p.join('')
      password_map[scramble_password(password, scramble_instructions)] = password
    end

    password_map[@start_word]
  end

  def scramble_password(password, scramble_instructions)
    word = password.split('')
    scramble_instructions.each do |line|
      line.strip!

      # puts "#{line} on #{word.join('')}"
      if /\Aswap position (?<pos_X>\d+) with position (?<pos_Y>\d+)\Z/ =~ line
        pos_X = Integer(pos_X)
        pos_Y = Integer(pos_Y)
        letter_at_x = word[pos_X]
        letter_at_y = word[pos_Y]
        word[pos_X] = letter_at_y
        word[pos_Y] = letter_at_x
      elsif /\Aswap letter (?<letter_X>\w+) with letter (?<letter_Y>\w+)\Z/ =~ line
        word.map! { |v|
          if v == letter_X
            letter_Y
          elsif v == letter_Y
            letter_X
          else
            v
          end
        }
      elsif /\Arotate left (?<steps>\d+)/ =~ line
        steps = Integer(steps)
        word.rotate!(steps)
      elsif /\Arotate right (?<steps>\d+)/ =~ line
        steps = Integer(steps)
        word.rotate!(-1 * steps)
      elsif /\Arotate based on position of letter (?<letter_X>\w+)\Z/ =~ line
        index = word.index(letter_X)
        if index >= 4
          index += 1
        end

        word.rotate!(-1 * (index + 1))
      elsif /\Areverse positions (?<being_reverse>\w+) through (?<end_reverse>\w+)\Z/ =~ line
        being_reverse = Integer(being_reverse)
        end_reverse = Integer(end_reverse)

        new_word = Array.new

        if being_reverse > 0
          new_word += word[0..being_reverse-1]
        end
        new_word += word[being_reverse..end_reverse].reverse

        if end_reverse < (word.size - 1)
          new_word += word[end_reverse+1..word.size-1]
        end

        word = new_word
      elsif /\Amove position (?<from_pos>\d+) to position (?<to_pos>\d+)\Z/ =~ line
        from_pos = Integer(from_pos)
        to_pos = Integer(to_pos)

        temp_letter = word[from_pos]
        word.delete_at(from_pos)
        word.insert(to_pos, temp_letter)
      else
        raise "Illegal instruction: #{line}"
      end

      # puts "Resulted on #{word.join('')}"
    end

    word.join('')
  end
end