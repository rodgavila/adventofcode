require_relative '../solutions/21.rb'

describe Problem21, :Problem21 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem21.new('abcde')
      p.load_input_from_file './input/21_sample.txt'
      expect(p.part_a).to eql('decab')
    end

    it "returns right answer for input" do
      p = Problem21.new('abcdefgh')
      p.load_input_from_file './input/21.txt'
      expect(p.part_a).to eql('bgfacdeh')
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem21.new('bdgheacf')
      p.load_input_from_file './input/21.txt'
      expect(p.part_b).to eql(146)
    end
  end
end