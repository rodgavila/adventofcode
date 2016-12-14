require_relative '../solutions/8.rb'

describe Problem8 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem8.new 7, 3
      p.load_input_from_file './input/8_sample.txt'
      expect(p.part_a).to eql(6)
    end

    it "returns right answer for input" do
      p = Problem8.new 50, 6
      p.load_input_from_file './input/8.txt'
      expect(p.part_a).to eql(116)
    end
  end

  describe "part_b" do
    before { skip("Visual answer. I'm not building an AI image recognition program...") }

    it "returns right answer for input" do
      p = Problem8.new 50, 6
      p.load_input_from_file './input/8.txt'
      expect(p.part_b).to eql(true)
    end
  end

end