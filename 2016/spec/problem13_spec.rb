require_relative '../solutions/13.rb'

describe Problem13, :Problem13 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem13.new(10, 7, 4)
      expect(p.part_a).to eql(42)
    end

    it "returns right answer for input" do
      p = Problem13.new(1350, 31, 39)
      expect(p.part_a).to eql(318007)
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem13.new
      expect(p.part_b).to eql(9227661)
    end
  end
end