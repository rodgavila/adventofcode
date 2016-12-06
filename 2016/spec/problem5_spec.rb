require_relative '../5.rb'

describe Problem5 do
  before { skip("Problem5 takes too long too run") }

  describe "part_a" do
    it "returns right answer for example" do
      p = Problem5.new
      p.input = "abc"
      expect(p.part_a).to eql('18f47a30')
    end

    
    it "returns right answer for input" do
      p = Problem5.new
      p.input = "ffykfhsq"
      expect(p.part_a).to eql('c6697b55')
    end
  end

  describe "part_b" do
    it "returns right answer for example" do
      p = Problem5.new
      p.input = "abc"
      expect(p.part_b).to eql('05ace8e3')
    end

    it "returns right answer for input" do
      p = Problem5.new
      p.input = "ffykfhsq"
      expect(p.part_b).to eql('8c35d1ab')
    end
  end
end
