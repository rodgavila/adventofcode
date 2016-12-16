require_relative '../solutions/10.rb'

describe Problem10, :Problem10 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem10.new
      p.load_input_from_file './input/10_sample.txt'
      expect(p.part_a 5, 2).to eql(2)
    end

    it "returns right answer for input" do
      p = Problem10.new
      p.load_input_from_file './input/10.txt'
      expect(p.part_a 61, 17).to eql(101)
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem10.new
      p.load_input_from_file './input/10.txt'
      expect(p.part_b 61, 17).to eql(37789)
    end
  end
end