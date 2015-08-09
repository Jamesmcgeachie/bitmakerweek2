# Set class "Person" using attr_accessor to allow @name to be accessed by the greeting outwith the class and def both the initialize method and greeting within so they would pass down to both other classes.
class Person

    attr_accessor :name
    
    def initialize(name)
        @name = name
    end
    
    def greeting
        puts "Hi, my name is #{@name}!"
    end
end

# Student class inherits from parent "Person" and has method "learn".
class Student < Person

    def learn
        puts "I get it!"
    end
end

# Instructor class inherits from parent "Person" and has method "teach".
class Instructor < Person

    def teach
        puts "Everything in Ruby is an Object."
    end
end

# set variables chris and cristina as new instances of Instructor and Student classes, with name as their initialization method. 
chris = Instructor.new("Chris")
cristina = Student.new("Cristina")

# calls "greeting" method on chris and cristina
chris.greeting
cristina.greeting

# calls "teach" and "learn" methods on chris and cristina.
chris.teach
cristina.learn

# cristina.teach does not work as "teach" method was set within the Instructor class and cristina is an instance of the Student class.
cristina.teach



