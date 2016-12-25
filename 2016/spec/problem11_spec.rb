require_relative '../solutions/11.rb'

describe Problem11, :Problem11 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem11.new
      p.load_input_from_file './input/11_sample.txt'
      expect(p.part_a).to eql(11)
    end

    it "returns right answer for input" do
      p = Problem11.new
      p.load_input_from_file './input/11.txt'
      expect(p.part_a).to eql(111)
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem11.new
      p.load_input_from_file './input/11.txt'
      expect(p.part_b).to eql(37789)
    end
  end
end