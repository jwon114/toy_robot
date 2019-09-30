class ToyRobot
  attr_reader :x, :y, :f
  X_GRID_MIN = 0
  X_GRID_MAX = 5
  Y_GRID_MIN = 0
  Y_GRID_MAX = 5
  FACING = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def initialize
    @x = nil
    @y = nil
    @f = nil
  end

  def place(x, y, f)
    raise ArgumentError.new('Invalid direction') if !FACING.include?(f)
    raise StandardError.new('Cannot place robot off 5x5 grid') if !x.between?(X_GRID_MIN, X_GRID_MAX) || !y.between?(Y_GRID_MIN, Y_GRID_MAX)

    @x = x
    @y = y
    @f = f
  end
  
  def move
    raise StandardError.new('Robot must be placed before moved') if [@x, @y, @f].any?(nil)

    invalid_move = (@x == X_GRID_MIN && @f == 'WEST') || (@x == X_GRID_MAX && @f == 'EAST') || (@y == Y_GRID_MIN && @f == 'SOUTH') || (@y == Y_GRID_MAX && @f == 'NORTH') 

    raise StandardError.new('Cannot move robot off 5x5 grid') if invalid_move

    case @f
    when 'NORTH'    
      @y += 1 
    when 'EAST' 
      @x += 1
    when 'SOUTH'
      @y -= 1
    when 'WEST'
      @x -= 1
    end
  end

  def left
    raise StandardError.new('Robot must be placed before rotated left') if [@x, @y, @f].any?(nil)

    facing_index = FACING.index(@f)
    @f = FACING[facing_index - 1]
  end

  def right
    raise StandardError.new('Robot must be placed before rotated right') if [@x, @y, @f].any?(nil)

    facing_index = FACING.index(@f)
    @f = FACING[(facing_index + 1) % FACING.size]
  end

  def report
    raise StandardError.new('Robot must be placed before reported') if [@x, @y, @f].any?(nil)

    print "x:#{@x}, y:#{@y}, f:'#{@f}'"
  end
end