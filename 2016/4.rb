require_relative 'problem.rb'
module Enumerable
  def stable_sort
    sort_by.with_index { |x, idx| [x, idx] }
  end

  def stable_sort_by
    sort_by.with_index { |x, idx| [yield(x), idx] }
  end
end

class EncryptedName
  attr_accessor :name, :sector, :checksum

  def initialize(name, sector, checksum)
    @name = name
    @sector = sector
    @checksum = checksum
  end

  def decrypted_name
    shift = @sector % 26
    @name.each_char.map { |c|
      if (c.eql?  '-') then
        ' '
      else
        (((c.ord - 'a'.ord + shift) % 26) + 'a'.ord).chr
      end
      }.join
  end

  def is_valid?
    map = @name.chars.group_by(&:chr).map { |k, v| [k, v.size] }
    map.sort_by! { |e| e[0] }.reverse!
    map = map.stable_sort_by { |e| e[1] }
    map.reverse!

    cs = ''
    map.each do |e|
      if not e[0].eql? '-'
        cs = "#{cs}#{e[0]}"
      end
    end
    cs[0..4].eql? @checksum
  end
end

class Problem4 < Problem
  def part_a
    sum_sectors = 0
    self.input.each_line do |line|
      room = parse_room(line)
      if room.is_valid?
        sum_sectors = sum_sectors + room.sector
      end
    end
    sum_sectors
  end

  def part_b
    self.input.each_line do |line|
      room = parse_room(line)
      if room.is_valid?
        puts room.decrypted_name
      end
    end
    -1
  end

  def parse_room(encrypted_name)
    name = encrypted_name[0..encrypted_name.index(/\d/)-1]
    sector_id = encrypted_name[encrypted_name.index(/\d/)..encrypted_name.index('[')-1]
    checksum = encrypted_name[encrypted_name.index('[')+1..encrypted_name.index(']')-1]
    EncryptedName.new(name, Integer(sector_id), checksum)
  end
end