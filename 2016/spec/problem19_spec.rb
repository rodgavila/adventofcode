require_relative '../solutions/19.rb'

describe Problem19, :Problem19 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem19.new
      p.input = 5
      expect(p.part_a).to eql(3)
    end

    it "returns right answer for input" do
      p = Problem19.new
      p.input = 3001330
      expect(p.part_a).to eql(1808357)
    end
  end

  describe "part_b" do
    it "returns right answer for example" do
      p = Problem19.new
      p.input = 5
      expect(p.part_b).to eql(2)
    end

    it "returns right answer for input" do
      p = Problem19.new
      p.input = 3001330
      expect(p.part_b).to eql(1407007)
    end
  end
end