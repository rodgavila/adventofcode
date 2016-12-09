require_relative '../solutions/6.rb'

describe Problem6 do
  describe "part_a" do
    it "returns right answer for example" do
      p = Problem6.new
      p.load_input_from_file './input/6_sample.txt'
      expect(p.part_a).to eql('easter')
    end

    it "returns right answer for input" do
      p = Problem6.new
      p.load_input_from_file './input/6.txt'
      expect(p.part_a).to eql('qtbjqiuq')
    end
  end

  describe "part_b" do
    it "returns right answer for example" do
      p = Problem6.new
      p.load_input_from_file './input/6_sample.txt'
      expect(p.part_b).to eql('advent')
    end

    it "returns right answer for input" do
      p = Problem6.new
      p.load_input_from_file './input/6.txt'
      expect(p.part_b).to eql('akothqli')
    end
  end
end