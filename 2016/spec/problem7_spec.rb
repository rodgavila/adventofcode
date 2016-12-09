require_relative '../solutions/7.rb'

describe Problem7 do
  describe "part_a" do
    it "returns right answer for example 1" do
      p = Problem7.new
      p.input = 'abba[mnop]qrst'
      expect(p.part_a).to eql(1)
    end

    it "returns right answer for example 2" do
      p = Problem7.new
      p.input = 'abcd[bddb]xyyx'
      expect(p.part_a).to eql(0)
    end

    it "returns right answer for example 3" do
      p = Problem7.new
      p.input = 'aaaa[qwer]tyui'
      expect(p.part_a).to eql(0)
    end

    it "returns right answer for example 4" do
      p = Problem7.new
      p.input = 'ioxxoj[asdfgh]zxcvbnt'
      expect(p.part_a).to eql(1)
    end

    it "returns right answer for input" do
      # skip("While testing")
      p = Problem7.new
      p.load_input_from_file './input/7.txt'
      expect(p.part_a).to eql(105)
    end
  end

  describe "part_b" do
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