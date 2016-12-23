require_relative '../solutions/15.rb'

describe Problem15, :Problem15 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem15.new
      p.load_input_from_file './input/15_sample.txt'
      expect(p.part_a).to eql(5)
    end

    it "returns right answer for input" do
      p = Problem15.new
      p.load_input_from_file './input/15.txt'
      expect(p.part_a).to eql(16824)
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem15.new
      p.load_input_from_file './input/15.txt'
      expect(p.part_b).to eql(3543984)
    end
  end
end