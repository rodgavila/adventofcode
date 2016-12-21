require_relative 'problem.rb'

class Range
  def intersects?(other)
    (self.max >= other.min && self.max <= other.max) ||
        (other.max >= self.min && other.max <= self.max)
  end

  def contiguous?(other)
    self.max == (other.min - 1) || other.max == (self.min - 1)
  end

  def join(other)
    return nil if not intersects?(other) and not contiguous?(other)
    [self.min, other.min].min..[self.max, other.max].max
  end
end

class Problem20 < Problem
  MAX_IP = 4294967295

  def part_a
    ip_ranges = build_ip_ranges
    ip_ranges[0].min == 0 ? ip_ranges[0].max + 1 : 0
  end

  def part_b
    ip_ranges = build_ip_ranges

    num_valid_ips = 0

    num_valid_ips += ip_ranges[0].min
    (0..ip_ranges.size - 2).each do |i|
      num_valid_ips += ip_ranges[i+1].min - ip_ranges[i].max - 1
    end
    num_valid_ips += (MAX_IP - ip_ranges[ip_ranges.size-1].max)

    num_valid_ips
  end

  def build_ip_ranges
    ip_ranges = Array.new
    self.input.each_line do |line|
      line.strip!
      # puts "#{line}"
      if /\A(?<low_limit>\d+)-(?<high_limit>\d+)\Z/ =~ line
        low_limit = Integer(low_limit)
        high_limit = Integer(high_limit)
        ip_ranges << (low_limit..high_limit)
      else
        raise "Invalid IP range: #{line}"
      end
    end

    ip_ranges.sort! {
        |x, y|
      x.min <=> y.min
    }

    i = 0
    while i < (ip_ranges.size-1)
      if (ip_ranges[i].intersects?(ip_ranges[i+1]) || ip_ranges[i].contiguous?(ip_ranges[i+1]) )
        ip_ranges[i] = ip_ranges[i].join(ip_ranges[i+1])
        ip_ranges.delete_at(i+1)
      else
        i += 1
      end
    end

    # ip_ranges.each_with_index { |v, i| puts "#{i}: #{v}"}
    ip_ranges
  end
end