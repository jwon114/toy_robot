class ToyRobot
  attr_reader :x, :y, :f
  X_GRID_MIN = 0
  X_GRID_MAX = 5
  Y_GRID_MIN = 0
  Y_GRID_MAX = 5
  FACING = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  VALID_ACTIONS = ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT', 'HELP']

  def initialize
    @x = nil
    @y = nil
    @f = nil
  end

  def place(x, y, f)
    x = Integer(x)
    y = Integer(y)
    f = f.upcase
    
    raise ArgumentError.new('Invalid direction') unless FACING.include?(f)
    raise StandardError.new('Cannot place robot off 5x5 grid') unless x.between?(X_GRID_MIN, X_GRID_MAX) && y.between?(Y_GRID_MIN, Y_GRID_MAX)

    @x = x
    @y = y
    @f = f
  end
  
  def move
    place_check(message: 'Robot must be placed before moved')

    invalid_move = (@x == X_GRID_MIN && @f == 'WEST') || (@x == X_GRID_MAX && @f == 'EAST') || (@y == Y_GRID_MIN && @f == 'SOUTH') || (@y == Y_GRID_MAX && @f == 'NORTH') 
    
    unless invalid_move
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
  end

  def left
    place_check(message: 'Robot must be placed before rotated left')    

    facing_index = FACING.index(@f)
    @f = FACING[facing_index - 1]
  end

  def right
    place_check(message: 'Robot must be placed before rotated right')

    facing_index = FACING.index(@f)
    @f = FACING[(facing_index + 1) % FACING.size]
  end

  def report
    place_check(message: 'Robot must be placed before reported')

    puts "x:#{@x}, y:#{@y}, f:#{@f}"
  end

  def help
    puts
    puts '-----------------------------------------------------------'
    puts 'Command Usage:'
    puts '-----------------------------------------------------------'
    puts '-- PLACE: places robot on board with positions x and y, facing in direction'
    puts 'place x, y, facing'
    puts '-- MOVE: moves the robot 1 unit in the direction it is facing'
    puts 'move'
    puts '-- LEFT: rotates the robot left'
    puts 'left'
    puts '-- RIGHT: rotates the robot right'
    puts 'right'
    puts '-- REPORT: reports on the robots current position and direction'
    puts 'report'
    puts
  end

  private

  def place_check(message:)
    raise StandardError.new(message) if [@x, @y, @f].any?(nil)
  end
end