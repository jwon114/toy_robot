require './toy_robot'
require 'pry'
VALID_ACTIONS = ['PLACE', 'MOVE', 'LEFT', 'RIGHT', 'REPORT']

puts '---------------------- Robot Activated ---------------------- '
tr = ToyRobot.new
loop do
  puts '-- Waiting for command..'
  action = gets.chomp.split(' ')
  command, args = action
  
  break if command.upcase == 'EXIT' && action.size == 1
  
  unless VALID_ACTIONS.include?(command.upcase)
    puts 'ERROR - Not a valid command'
    next
  end
  
  if args.nil?
    tr.send command.downcase.to_sym
  else
    tr.send command.downcase.to_sym, *args.split(',')
  end  
end

