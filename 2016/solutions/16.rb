require_relative 'problem.rb'

class Problem16 < Problem
  def initialize(length)
    @length = length
  end

  def part_a
    data = self.input
    data = data.split('').map { |v| v == '1' }

    while data.size < @length
      b = data.clone.reverse.map { |v| !v }
      data << false
      data += b
    end

    data = data[0, @length]

    checksum = calculate_checksum(data)
    while checksum.size.even?
      checksum = calculate_checksum(checksum)
    end

    checksum.map { |v| v ? '1' : '0'}.join()
  end

  def calculate_checksum(data)
    checksum = Array.new
    (0..data.size-1).step(2) do |i|
      checksum << (data[i] == data[i+1])
    end
    checksum
  end

  def part_b
    self.input.each_line do |line|
      # Process input here
    end
  end
end