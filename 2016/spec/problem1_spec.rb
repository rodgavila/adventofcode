require_relative '../1.rb'

describe Problem1 do
  context "aux_functions" do
    describe "Coord.clone" do
      it "clones successfuly" do
        original = Coord.new
        original.x = -17
        original.y = 49
        dup = original.clone

        expect(dup.x).to eql(-17)
        expect(dup.y).to eql(49)
        expect(original.eql?(dup))
        expect(original.equal?(dup)).to eql(false)
      end
    end

    describe "Coord set" do
      it "fails to add duplicate element" do
        test_set = Set.new
        coord_a = Coord.new
        coord_a.x = -17
        coord_a.y = 49

        coord_b = coord_a.clone

        test_set.add coord_a
        expect(test_set.add?(coord_b)).to eql(nil)
      end
    end
  end

  describe "part_a" do
    it "returns right answer" do
      expect(Problem1.new.part_a).to eql(253)
    end
  end

  describe "part_b" do
    it "returns right answer" do
      expect(Problem1.new.part_b).to eql(126)
    end
  end
end