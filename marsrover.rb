# Problem to solve was creating a Mars Rover object that can move within a field of 9 by 9 coordinates,
# receiving user input to either turn left or right, or to move forward and then for its position and
# direction to be updated accordingly
# Solution incomplete as looking to establish plateau size and set movement restrictions, as well as incorporating
# collission detection.



class Rover 

    attr_accessor :x, :y, :direction
    
    # defining initial coordinates and direction and then printing to confirm correct assignment
    
    def initialize(x, y, direction)
        @x = x.to_i
        @y = y.to_i
        @direction = direction.to_s
        puts "Initial Coordinates are (#{@x}, #{@y}) and the rover is facing #{@direction}"
    end
    
    # Read instructions method will receive userinput and decide if a turn or move instruction.
    def read_instruction(usertext)
        instructions = usertext.split("")
           instructions.each do |action|
               if action == "L" || action == "R"
                    turn(action)
               elsif action == "M"
                    move(action)
               else
                    puts "Invalid Input"
               end
           end
    end
        
    
    def turn(input)
        if input == "L" && @direction == "N"
            @direction = "W"
        elsif input == "R" && @direction == "N"
            @direction = "E"
        elsif input == "L" && @direction == "W"
            @direction = "S"
        elsif input == "R" && @direction == "W"
            @direction = "N"
        elsif input == "L" && @direction == "S"
            @direction = "E"
        elsif input == "R" && @direction == "S"
            @direction = "W"
        elsif input == "L" && @direction == "E"
            @direction = "N"
        elsif input == "R" && @direction == "E"
            @direction = "S"
        else
            p "invalid turn"
        end
        return @direction
    end
    
             
    def move(input)
        if  input == "M" && @direction == "N" 
            @y += 1
        elsif input == "M" && @direction == "W"
            @x -= 1
        elsif input == "M" && @direction == "E"
            @x += 1
        elsif input == "M" && @direction == "S"
            @y -= 1
        else
            p "invalid move"
        end
    end
    
    def update
        puts "Coordinates are now (#{@x}, #{@y}) and the direction facing is #{@direction}"
    end
end
        
# Setting initial coordinates and direction and then prompting for initial read_instruction input
rover1 = Rover.new(0, 0, "N")
puts "Rover 1 For direction change, type L or R. For movement, type M. Multiple commands will be recognised in sequence."

# Taking read_instruction userinput to use in the class method
rover1.read_instruction(gets.chomp)

# new coordinates printed
rover1.update

puts "\nSecond Rover, status."
rover2 = Rover.new(2, 5, "S")
puts "Rover 2, for direction change, type L or R. For movement, type M. Multiple commands will be recognised in sequence."
rover2.read_instruction(gets.chomp)

rover2.update
             
