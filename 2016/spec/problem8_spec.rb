require_relative '../solutions/8.rb'

describe Problem8 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem8.new 7, 3
      p.load_input_from_file './input/8_sample.txt'
      expect(p.part_a).to eql(6)
    end

    it "returns right answer for input" do
      skip("For now")
      # skip("While testing")
      p = Problem8.new 50, 6
      p.load_input_from_file './input/8.txt'
      expect(p.part_a).to eql(nil)
    end
  end

  describe "part_b" do
    skip ("Until it is implemented")
    it "returns right answer for example 1" do
      p = Problem7.new
      p.input = 'aba[bab]xyz'
      expect(p.part_b).to eql(1)
    end

    it "returns right answer for example 2" do
      p = Problem7.new
      p.input = 'xyx[xyx]xyx'
      expect(p.part_b).to eql(0)
    end

    it "returns right answer for example 3" do
      p = Problem7.new
      p.input = 'aaa[kek]eke'
      expect(p.part_b).to eql(1)
    end

    it "returns right answer for example 4" do
      p = Problem7.new
      p.input = 'zazbz[bzb]cdb'
      expect(p.part_b).to eql(1)
    end

    it "returns right answer for input" do
      # skip("While testing")
      p = Problem7.new
      p.load_input_from_file './input/7.txt'
      expect(p.part_b).to eql(258)
    end
  end

end