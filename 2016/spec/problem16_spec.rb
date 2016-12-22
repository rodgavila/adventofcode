require_relative '../solutions/16.rb'

describe Problem16, :Problem16 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem16.new(20)
      p.input = '10000'
      expect(p.part_a).to eql('01100')
    end

    it "returns right answer for input" do
      p = Problem16.new(272)
      p.input = '00101000101111010'
      expect(p.part_a).to eql('10010100110011100')
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem16.new(35651584)
      p.input = '00101000101111010'
      expect(p.part_a).to eql('01100100101101100')
    end
  end
end