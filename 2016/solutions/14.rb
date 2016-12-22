require_relative 'problem.rb'

class Key
  attr_accessor :index, :key, :repeated_digit
  def initialize(index, key, repeated_digit)
    @index = index
    @key = key
    @repeated_digit = repeated_digit
  end

  def to_s
    "{index=#{@index}, key=#{@key}, repeated_number=#{@repeated_digit}}"
  end
end

class KeyGenerator
  def initialize
    @digest = Digest::MD5.new
  end
end

class SimpleMd5KeyGenerator < KeyGenerator
  def generateKey(seed)
    @digest.hexdigest seed
  end
end

class StretchedKeyGenerator < KeyGenerator
  def generateKey(seed)
    key = @digest.hexdigest seed
    2016.times do
      key = @digest.hexdigest key
    end
    key
  end
end

class Problem14 < Problem
  NUM_OF_KEYS = 64

  def part_a
    solve_brute_force(SimpleMd5KeyGenerator.new)
  end

  def part_b
    solve_brute_force(StretchedKeyGenerator.new)
  end

  def solve_part_a_other
    prefix = self.input
    md5 = Digest::MD5.new

    i = 0
    possible_keys = Array.new
    keys = Array.new

    while keys.size < NUM_OF_KEYS # keys_found < NUM_OF_KEYS
      possible_key = md5.hexdigest "#{prefix}#{i}"

      if /(?<num>\w)(\k<num>){2}/ =~ possible_key
        possible_keys << Key.new(i, possible_key, num)

        if /(?<num_2>\w)(\k<num_2>){4}/ =~ possible_key
          possible_keys.delete_if { |v| (v.index+1000) < i}

          j = 0
          while j < possible_keys.size
            if possible_keys[j].repeated_digit == num
              keys << possible_keys[j]
              possible_keys.delete_at(j)
            else
              j += 1
            end
          end
        end
      end

      i += 1
    end

    keys.sort_by! { |v| v.index }

    keys[NUM_OF_KEYS-1].index
  end

  def solve_brute_force(key_generator)
    prefix = self.input

    all_keys = Array.new(10000)
    keys = Array.new

    # (0..all_keys.size-1).each do |i|
    #   all_keys[i] = md5.hexdigest "#{prefix}#{i}"
    # end

    i = 0

    while keys.size < NUM_OF_KEYS
      all_keys[i] = key_generator.generateKey("#{prefix}#{i}")
      # puts "Trying key #{i}"
      if /(?<num>\w)(\k<num>){2}/ =~ all_keys[i]
        (i+1..i+1000).each do |j|
          all_keys[j] ||= key_generator.generateKey("#{prefix}#{j}")
          if /(#{num}){5}/ =~ all_keys[j]
            puts "Key #{keys.size + 1} (#{all_keys[i]}) found! at #{i}"
            puts "  confirmed by #{all_keys[j]} at #{j}"
            keys << all_keys[i]
            break
          end
        end
      end
      i += 1
    end

    i-1
  end
end