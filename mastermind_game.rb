require_relative 'console'

class Mastermind
    include Console

    #CONSTANTS: the 6 colours

    def initialize
        #?
    end

    def set_puzzle
        #computer randomly chooses 4 colours out of the 6 CONSTANTS
        #- are repeat colours allowed?
        #the 4 colours are assigned to the 4 positions
        #- local variable, type array
    end

    def play
        set_puzzle

        #loop
            #get_user_guess
            #if correct
                #user wins
                #run win script
                #return
            #elsif 12th go
                #user loses
                #run lose script
                #return
            #else
                #give_feedback
            #end
        #end 

    end
end