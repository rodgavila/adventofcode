require_relative '../solutions/20.rb'

describe Problem20, :Problem20 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem20.new
      p.load_input_from_file './input/20_sample.txt'
      expect(p.part_a).to eql(3)
    end

    it "returns right answer for input" do
      p = Problem20.new
      p.load_input_from_file './input/20.txt'
      expect(p.part_a).to eql(4793564)
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem20.new
      p.load_input_from_file './input/20.txt'
      expect(p.part_b).to eql(146)
    end
  end
end