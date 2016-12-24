require_relative '../solutions/23.rb'

describe Problem23, :Problem23 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem23.new
      p.load_input_from_file './input/23_sample.txt'
      expect(p.part_a).to eql(3)
    end

    it "returns right answer for input" do
      p = Problem23.new
      p.interpreter.rA = 7
      p.load_input_from_file './input/23.txt'
      expect(p.part_a).to eql(11130)
    end

    it "returns right answer for optimized input" do
      p = Problem23.new
      # p.interpreter.debug = true
      p.interpreter.rA = 7
      p.load_input_from_file './input/23_optimized.txt'
      expect(p.part_a).to eql(11130)
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem23.new
      # p.interpreter.debug = true
      p.interpreter.rA = 12
      p.load_input_from_file './input/23_optimized.txt'
      expect(p.part_a).to eql(479007690)
    end
  end
end