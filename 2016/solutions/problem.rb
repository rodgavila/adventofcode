class Problem
  attr_accessor :input

  def initialize
    @input = ''
  end

  def load_input_from_file(file)
    file = File.open(file, 'r')
    @input = file.read
    file.close
  end
end