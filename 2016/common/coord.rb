class Coord
  attr_accessor :x, :y

  def initialize(x=0,y=0)
    @x = x
    @y = y
  end

  def get_distance_from_origin
    @x.abs + @y.abs
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def eql?(other)
    self == other
  end

  def hash
    [x, y].hash
  end

  def to_s
    "(#{x},#{y})"
  end
end