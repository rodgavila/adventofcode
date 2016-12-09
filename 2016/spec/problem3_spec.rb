require_relative '../solutions/3.rb'

describe Problem3 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem3.new
      p.input = "5 10 25"
      expect(p.part_a).to eql(0)
    end

    it "returns right answer for input" do
      p = Problem3.new
      p.load_input_from_file './input/3.txt'
      expect(p.part_a).to eql(982)
    end
  end

  describe "part_b" do
    it "returns right answer for example" do
      p = Problem3.new
      p.load_input_from_file './input/3b_sample.txt'
      expect(p.part_b).to eql(6)
    end

    it "returns right answer for input" do
      p = Problem3.new
      p.load_input_from_file './input/3.txt'
      expect(p.part_b).to eql(1826)
    end
  end
end