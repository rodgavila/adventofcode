require_relative '../solutions/2.rb'

describe Problem2 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem2.new
      p.input = %w(ULL RRDDD LURDL UUUUD).join("\n")
      expect(p.part_a).to eql('1985')
    end

    it "returns right answer for input" do
      p = Problem2.new
      p.load_input_from_file './input/2.txt'
      expect(p.part_a).to eql('78293')
    end
  end

  describe "part_b" do
    it "returns right answer for example" do
      p = Problem2.new
      p.input = %w(ULL RRDDD LURDL UUUUD).join("\n")
      expect(p.part_b).to eql('5DB3')
    end

    it "returns right answer for input" do
      p = Problem2.new
      p.load_input_from_file './input/2.txt'
      expect(p.part_b).to eql('AC8C8')
    end
  end
end