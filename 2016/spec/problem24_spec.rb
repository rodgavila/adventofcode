require_relative '../solutions/24.rb'

describe Problem24, :Problem24 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem24.new
      p.load_input_from_file './input/24_sample.txt'
      expect(p.part_a).to eql(14)
    end

    it "returns right answer for input", :skip do
      p = Problem24.new
      p.load_input_from_file './input/24.txt'
      expect(p.part_a).to eql(460)
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem24.new
      p.load_input_from_file './input/24.txt'
      expect(p.part_b).to eql(668)
    end
  end
end