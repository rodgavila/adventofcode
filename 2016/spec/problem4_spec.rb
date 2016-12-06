require_relative '../4.rb'

describe Problem4 do
  describe "part_a" do
    it "sample 1 is a real room" do
      p = Problem4.new
      p.input = "aaaaa-bbb-z-y-x-123[abxyz]"
      expect(p.part_a).to eql(123)
    end
    it "sample 2 is a real room" do
      p = Problem4.new
      p.input = "a-b-c-d-e-f-g-h-987[abcde]"
      expect(p.part_a).to eql(987)
    end
    it "sample 3 is a real room" do
      p = Problem4.new
      p.input = "not-a-real-room-404[oarel]"
      expect(p.part_a).to eql(404)
    end
    it "sample 4 is a decoy" do
      p = Problem4.new
      p.input = "totally-real-room-200[decoy]"
      expect(p.part_a).to eql(0)
    end
    it "returns right answer for input" do
      p = Problem4.new
      p.load_input_from_file './input/4.txt'
      expect(p.part_a).to eql(137896)
    end
  end

  describe "EncryptedName" do
    it "decyper" do
      room_name = EncryptedName.new('qzmt-zixmtkozy-ivhz', 343, 'checksum')
      expect(room_name.decrypted_name).to eql('very encrypted name')
    end
  end

  describe "part_b" do
    it "returns right answer for input" do
      p = Problem4.new
      p.load_input_from_file './input/4.txt'
      expect(p.part_b).to eql(501)
    end
  end
end