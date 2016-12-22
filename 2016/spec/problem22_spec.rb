require_relative '../solutions/22.rb'

describe Problem22, :Problem22 do
  describe "part_a" do
    it "returns right answer for input" do
      p = Problem22.new
      p.load_input_from_file './input/22.txt'
      expect(p.part_a).to eql(934)
    end
  end

  describe "part_b", :skip do
    it "returns right answer for example" do
      p = Problem22.new
      p.input = 'abc'
      expect(p.part_b).to eql(22551)
    end

    it "returns right answer for input" do
      p = Problem22.new
      p.input = 'cuanljph'
      expect(p.part_b).to eql(20606)
    end
  end
end