class ToyRobot
  attr_reader :x, :y, :f
  X_GRID = 5
  Y_GRID = 5
  FACING = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def initialize
    @x = nil
    @y = nil
    @f = nil
  end

  def place(x, y, f)

    @x = x
    @y = y
    @f = f
  end

  
end