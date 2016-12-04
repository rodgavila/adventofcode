require_relative '../2.rb'

describe Problem2 do
  describe "part_a" do
    it "returns right answer for example" do
      p2 = Problem2.new
      p2.input = %w(ULL RRDDD LURDL UUUUD).join("\n")
      expect(p2.part_a).to eql('1985')
    end

    it "returns right answer for input" do
      p2 = Problem2.new
      p2.load_input_from_file './input/2.txt'
      expect(p2.part_a).to eql('78293')
    end
  end

  describe "part_b" do
    it "returns right answer for example" do
      p2 = Problem2.new
      p2.input = %w(ULL RRDDD LURDL UUUUD).join("\n")
      expect(p2.part_b).to eql('5DB3')
    end

    it "returns right answer for input" do
      p2 = Problem2.new
      p2.load_input_from_file './input/2.txt'
      expect(p2.part_b).to eql('AC8C8')
    end
  end
end