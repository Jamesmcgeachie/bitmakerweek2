# Solution incomplete + does not work

class Rover 

    attr_accessor :x, :y, :direction, :userinput
    
    # defining initial coordinates and direction and then printing to confirm correct assignment
    
    def initialize(x, y, direction)
        @x = x
        @y = y
        @direction = direction
        puts "Initial Coordinates are (#{@x}, #{@y}) and the rover is facing #{@direction}"
    end
    
    # Read instructions method will receive userinput (see program outside class) and decide if a turn or move instruction.
    def read_instruction(x)
        if x == "L" || x == "R"
            turn
        elsif x == "M"
            move
        else
            puts "Invalid Input"
        end
    end
        
    # If read_instruction is for turning, this prompts for the specific direction again as I was unsure of
    # how to ensure I get the user's input within this method. It then is supposed to check for
    # 2 conditions to be met (current direction and user's input) and then reassign @direction accordingly
    # However, it does not seem to work.
    
    def turn
        p "Enter a direction, L or R"
        @userinput = gets.chomp
        if @userinput == "L" && @direction == "N"
            @direction = "W"
        elsif @userinput == "R" && @direction == "N"
            @direction = "E"
        elsif @userinput == "L" && @direction == "W"
            @direction = "S"
        elsif @userinput == "R" && @direction == "W"
            @direction = "N"
        elsif @userinput == "L" && @direction == "S"
            @direction = "E"
        elsif @userinput == "R" && @direction == "S"
            @direction = "W"
        elsif @userinput == "L" && @direction == "E"
            @direction = "N"
        elsif @userinput == "R" && @direction == "E"
            @direction = "S"
        else
            p "invalid turn"
        end
        return @direction
    end
    
    
    # If read_instruction is for moving, this prompts user to confirm the move again as I was unsure
    # how to ensure I get the user's input within this method. It then is supposed to check for
    # 2 conditions to be met (current direction and user's input) and then appropriate + or - 1 to the x
    # or y coordinate. However, it does not seem to work.
            
    def move
        p "Do you wish to move forward? Enter M"
        @userinput = gets.chomp
        if @userinput == "M" && @direction == "N" 
            @y += 1
        elsif @userinput == "M" && @direction == "W"
            @x -= 1
        elsif @userinput == "M" && @direction == "E"
            @x += 1
        elsif @userinput == "M" && @direction == "S"
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
puts "For direction change, type L or R. For movement, type M"

# Taking read_instruction userinput to use in the class method
rover1.read_instruction(gets.chomp)

# new coordinates
rover1.update

             
