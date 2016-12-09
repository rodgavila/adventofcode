require_relative '../solutions/7.rb'

describe Problem7 do
  describe "part_a" do
    it "returns right answer for example 1" do
      p = Problem7.new
      p.input 'abba[mnop]qrst'
      expect(p.part_a).to eql(true)
    end

    it "returns right answer for example 2" do
      p = Problem7.new
      p.input 'abcd[bddb]xyyx'
      expect(p.part_a).to eql(false)
    end

    it "returns right answer for example 3" do
      p = Problem7.new
      p.input 'aaaa[qwer]tyui'
      expect(p.part_a).to eql(false)
    end

    it "returns right answer for example 4" do
      p = Problem7.new
      p.input 'ioxxoj[asdfgh]zxcvbnt'
      expect(p.part_a).to eql(true)
    end

    it "returns right answer for input" do
      p = Problem7.new
      p.load_input_from_file './input/7.txt'
      expect(p.part_a).to eql(nil)
    end
  end

  # describe "part_b" do
  #   it "returns right answer for example" do
  #     p = Problem6.new
  #     p.load_input_from_file './input/6_sample.txt'
  #     expect(p.part_b).to eql('advent')
  #   end
  #
  #   it "returns right answer for input" do
  #     p = Problem6.new
  #     p.load_input_from_file './input/6.txt'
  #     expect(p.part_b).to eql('akothqli')
  #   end
  # end
end