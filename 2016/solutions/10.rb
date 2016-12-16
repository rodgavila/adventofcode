require_relative 'problem.rb'

class Robot
  def initialize (id)
    @id = id
    @first_token = nil
    @second_token = nil
    @give_proc = nil
  end

  def give_proc=(give_proc)
    if not @give_proc.nil?
      raise 'We already have a proc'
    end

    @give_proc = give_proc
    if can_give
      give
    end
  end

  def take(chip)
    if @first_token.nil?
      @first_token = chip
    elsif @second_token.nil?
      @second_token = chip
      if can_give
        give
      end
    else
      raise 'Unreachable: We should not be holding two tokens'
    end
  end

  def can_give
    (not @first_token.nil?) && (not @second_token.nil?) && (not @give_proc.nil?)
  end

  def give()
    if @give_proc.nil?
      raise "Robot #{@id} does know what to do with tokens [#{@first_token}, #{@second_token}]!"
    else
      low_chip = [@first_token, @second_token].min
      high_chip = [@first_token, @second_token].max
      @first_token = nil
      @second_token = nil
      @give_proc.call(low_chip, high_chip)
    end
  end
end

class Problem10 < Problem

  def initialize
    @outputs = nil
  end

  def part_a (target_chip_1, target_chip_2)
    bots = Hash.new
    @outputs = Hash.new
    i = 0
    solution = nil
    self.input.each_line do |line|
      # puts "Raw Line: #{i}: #{line}"
      i = i+1
      if /value (?<chip>\d+) goes to bot (?<bot_num>\d+)/ =~ line
        chip = Integer(chip)
        bot_num = Integer(bot_num)

        bots[bot_num] ||= Robot.new bot_num

        bots[bot_num].take chip
      elsif /bot (?<giving_bot>\d+) gives low to (?<low_target>bot|output) (?<low_target_id>\d+) and high to (?<high_target>bot|output) (?<high_target_id>\d+)/ =~ line
        giving_bot = Integer(giving_bot)
        low_target_id = Integer(low_target_id)
        high_target_id = Integer(high_target_id)
        low_target_is_bot = low_target.eql? 'bot'
        high_target_is_bot = high_target.eql? 'bot'

        give_proc = Proc.new do |low_chip, high_chip|
          # puts "{giving_bot=#{giving_bot}, low_target=#{low_target} #{low_target_id}, high_target=#{high_target} #{high_target_id}}"
          # puts "{low_chip=#{low_chip}, high_chip=#{high_chip}}"

          if ([low_chip, high_chip] & [target_chip_1, target_chip_2]).size == 2
            # puts "Found our robot!!! It is #{giving_bot}"
            solution = giving_bot
          end

          if low_target_is_bot
            bots[low_target_id] ||= Robot.new low_target_id
            bots[low_target_id].take low_chip
          else
            @outputs[low_target_id] = low_chip
          end

          if high_target_is_bot
            bots[high_target_id] ||= Robot.new low_target_id
            bots[high_target_id].take high_chip
          else
            @outputs[high_target_id] = high_chip
          end

        end

        bots[giving_bot] ||= Robot.new giving_bot
        bots[giving_bot].give_proc = give_proc
      else
        raise "Unexpected instruction: #{line}"
      end
    end
    solution
  end

  def part_b (target_chip_1, target_chip_2)
    part_a target_chip_1, target_chip_2
    @outputs[0] * @outputs[1] * @outputs[2]
  end
end