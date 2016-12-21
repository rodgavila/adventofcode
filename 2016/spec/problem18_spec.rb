require_relative '../solutions/18.rb'

describe Problem18, :Problem18 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem18.new('.^^.^.^^^^', 10)
      expect(p.part_a).to eql(38)
    end

    it "returns right answer for input" do
      p = Problem18.new('.^^^^^.^^.^^^.^...^..^^.^.^..^^^^^^^^^^..^...^^.^..^^^^..^^^^...^.^.^^^^^^^^....^..^^^^^^.^^^.^^^.^^', 40)
      expect(p.part_a).to eql(1989)
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem18.new('.^^^^^.^^.^^^.^...^..^^.^.^..^^^^^^^^^^..^...^^.^..^^^^..^^^^...^.^.^^^^^^^^....^..^^^^^^.^^^.^^^.^^', 400000)
      expect(p.part_b).to eql(19999894)
    end
  end
end