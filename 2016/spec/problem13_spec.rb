require_relative '../solutions/13.rb'

describe Problem13, :Problem13 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem13.new(10)
      expect(p.part_a(7, 4)).to eql(11)
    end

    it "returns right answer for input" do
      p = Problem13.new(1350)
      expect(p.part_a(31, 39)).to eql(92)
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem13.new(1350)
      expect(p.part_b(50)).to eql(124)
    end
  end
end