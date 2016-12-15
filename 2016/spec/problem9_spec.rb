require_relative '../solutions/9.rb'

describe Problem9, :Problem9 do
  describe "part_a" do
    it "returns right answer for example 1" do
      p = Problem9.new
      p.input = 'ADVENT'
      expect(p.part_a).to eql(6)
    end

    it "returns right answer for example 2" do
      p = Problem9.new
      p.input = 'A(1x5)BC'
      expect(p.part_a).to eql(7)
    end

    it "returns right answer for example 3" do
      p = Problem9.new
      p.input = '(3x3)XYZ'
      expect(p.part_a).to eql(9)
    end

    it "returns right answer for example 4" do
      p = Problem9.new
      p.input = 'A(2x2)BCD(2x2)EFG'
      expect(p.part_a).to eql(11)
    end

    it "returns right answer for example 5" do
      p = Problem9.new
      p.input = '(6x1)(1x3)A'
      expect(p.part_a).to eql(6)
    end

    it "returns right answer for example 6" do
      p = Problem9.new
      p.input = 'X(8x2)(3x3)ABCY'
      expect(p.part_a).to eql(18)
    end

    it "returns right answer for input" do
      p = Problem9.new
      p.load_input_from_file './input/9.txt'
      expect(p.part_a).to eql(123908)
    end
  end

  describe "part_b" do
    it "returns right answer for example 1" do
      p = Problem9.new
      p.input = '(3x3)XYZ'
      expect(p.part_b).to eql('XYZXYZXYZ'.size)
    end

    it "returns right answer for example 2" do
      p = Problem9.new
      p.input = 'X(8x2)(3x3)ABCY'
      expect(p.part_b).to eql('XABCABCABCABCABCABCY'.size)
    end

    it "returns right answer for example 3" do
      p = Problem9.new
      p.input = '(27x12)(20x12)(13x14)(7x10)(1x12)A'
      expect(p.part_b).to eql(241920)
    end

    it "returns right answer for example 4" do
      p = Problem9.new
      p.input = '(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN'
      expect(p.part_b).to eql(445)
    end

    it "returns right answer for input" do
      p = Problem9.new
      p.load_input_from_file './input/9.txt'
      expect(p.part_b).to eql(10755693147)
    end
  end
end