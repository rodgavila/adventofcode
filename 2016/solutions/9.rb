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
    self.input.each_line do |line|
      # Process input here
    end
  end
end