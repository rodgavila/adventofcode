require_relative 'problem.rb'

class Problem9 < Problem
  def part_a
    out = StringIO.new
    insideMarker = false
    reptString = ''
    reptChars = 0
    reptTimes = 0
    repeating = false
    marker = ''
    self.input.each_line do |line|
      line.strip!
      line.each_char do |c|
        # puts c
        # puts "{insideMarker=#{insideMarker}, repeating=#{repeating}"
        if insideMarker
          if c.eql? ')'
            insideMarker = false
            repeating = true
            if /\A(?<a>\d+)x(?<b>\d+)\Z/ =~ marker
              reptChars = Integer(a)
              reptTimes = Integer(b)
            else
              raise "Illegal marker: **#{marker}**"
            end
            # puts "Repeating the next #{reptChars} character(s) #{reptTimes} time(s)"
            marker = ''
          else
            marker << c
          end
        elsif repeating
          # puts 'repeating'
          reptString << c
          reptChars -= 1
          
          if (reptChars == 0)
            # puts "Repeating '#{reptString}' #{reptTimes} time(s)"
            reptTimes.times { out << reptString }
            repeating = false
            reptTimes = 0
            reptString = ''
          end
        elsif c.eql? '('
          insideMarker = true
        else
          out << c
        end
      end
    end
    decodedString = out.string
    # puts "Final String: #{decodedString}"
    decodedString.size
  end

  def part_b
    result = 0
    self.input.each_line do |line|
      result = count_characters_on(line)
    end
    result
  end

  def count_characters_on(string)
    returnCount = 0
    i = 0

    while i < string.size
      if (string[i].eql? '(')
        marker = string[i..string.index(')', i)]
        target_substring = string[(string.index(')', i) + 1)..(string.size-1)]
        # puts "Marker: #{marker}, Target Substring: #{target_substring}"
        if /\A\((?<num_chars>\d+)x(?<times>\d+)\)\Z/ =~ marker
          num_chars = Integer(num_chars)
          times = Integer(times)
          returnCount += times * count_characters_on(target_substring[0..(num_chars-1)])
          i += marker.size + num_chars
        else
          raise "Ill-formed repetition marker: #{marker}"
        end
      else
        returnCount += 1
        i += 1
      end
    end
    returnCount
  end
end