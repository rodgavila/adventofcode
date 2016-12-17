require_relative '../solutions/12.rb'

describe Problem12, :Problem12 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem12.new
      p.load_input_from_file './input/12_sample.txt'
      expect(p.part_a).to eql(42)
    end

    it "returns right answer for input" do
      p = Problem12.new
      p.load_input_from_file './input/12.txt'
      expect(p.part_a).to eql(318007)
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem12.new
      p.load_input_from_file './input/12.txt'
      expect(p.part_b).to eql(9227661)
    end
  end
end