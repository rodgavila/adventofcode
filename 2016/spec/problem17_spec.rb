require_relative '../solutions/17.rb'

describe Problem17, :Problem17 do
  describe "part_a" do
    it "returns right answer for example 0" do
      p = Problem17.new
      p.input = 'hijkl'
      expect(p.part_a).to eql(nil)
    end

    it "returns right answer for example 1" do
      p = Problem17.new
      p.input = 'ihgpwlah'
      expect(p.part_a).to eql('DDRRRD')
    end

    it "returns right answer for example 2" do
      p = Problem17.new
      p.input = 'kglvqrro'
      expect(p.part_a).to eql('DDUDRLRRUDRD')
    end

    it "returns right answer for example 3" do
      p = Problem17.new
      p.input = 'ulqzkmiv'
      expect(p.part_a).to eql('DRURDRUDDLLDLUURRDULRLDUUDDDRR')
    end

    it "returns right answer for input" do
      p = Problem17.new
      p.input = 'vwbaicqe'
      expect(p.part_a).to eql('DRDRULRDRD')
    end
  end

  describe "part_b" do
    it "returns right answer for example 1" do
      p = Problem17.new
      p.input = 'ihgpwlah'
      expect(p.part_b).to eql(370)
    end

    it "returns right answer for example 2" do
      p = Problem17.new
      p.input = 'kglvqrro'
      expect(p.part_b).to eql(492)
    end

    it "returns right answer for example 3" do
      p = Problem17.new
      p.input = 'ulqzkmiv'
      expect(p.part_b).to eql(830)
    end

    it "returns right answer for input" do
      p = Problem17.new
      p.input = 'vwbaicqe'
      expect(p.part_b).to eql(384)
    end
  end
end