require_relative '../solutions/14.rb'

describe Problem14, :Problem14 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem14.new
      p.input = 'abc'
      expect(p.part_a).to eql(22728)
    end

    it "returns right answer for input" do
      p = Problem14.new
      p.input = 'cuanljph'
      expect(p.part_a).to eql(23769)
    end
  end

  describe "part_b" do
    it "returns right answer for example" do
      p = Problem14.new
      p.input = 'abc'
      expect(p.part_b).to eql(22551)
    end

    it "returns right answer for input" do
      p = Problem14.new
      p.input = 'cuanljph'
      expect(p.part_b).to eql(20606)
    end
  end
end