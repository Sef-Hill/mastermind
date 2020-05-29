require_relative 'coloured_text'
require_relative 'validation_helper'
require_relative 'instructions'

module Console
    include NumbersToColours
    include ValidationHelper
    include Instructions

    def display_welcome_screen
        puts "\nMASTERMIND!"
        puts "Can you crack the code in 12 attempts?"
        display_instructions
        print "\nPress Enter/Return to start ..."
        gets 
    end

    def display_all_numbers_and_colours
        puts "\nHere are the colours and their numbers:"
        display_numbers_as_colours([1,2,3,4,5,6])
        puts ""
        display_horizontal_rule
    end

    def display_numbers_as_colours(numbers)
        numbers.each { |i| print number_to_colour(i) + " " }
        puts ""
        numbers.each { |i| print "  #{i}   " }
    end

    def get_user_guess(current_turn)
        display_all_numbers_and_colours if current_turn == 1
        puts "\nTurn no: #{current_turn}"
        print "Enter your guess as 4 digits ... "
        user_guess = get_valid_user_guess
        user_str_arr = user_guess.split("")
        user_str_arr.map { |c| c = c.to_i}
    end

    def display_feedback(feedback)        
        feedback_string = ""
        feedback[:exact].times { feedback_string += "●" }
        feedback[:close].times { feedback_string += "◯" }
        if feedback_string != ""
            padding = 4 - feedback_string.size
            padding.times { feedback_string += " "}
        end

        delay = 0.4
        print "\n"
        buffer = feedback_string == "" ? 27 : 33
        buffer.times { print " "}
        print "|"
        sleep delay
        if feedback_string == ""
            print "no matches|"
        else
            print feedback_string[0] + " "
            sleep delay
            print feedback_string[1] + "|\n"
            33.times { print " "}
            sleep delay
            print "|" + feedback_string[2] + " "
            sleep delay
            print feedback_string[3] + "|"
        end
        sleep delay
        puts ""
    end

    def display_horizontal_rule
        39.times { print "_"}
        puts ""
    end

    def display_user_wins  
        puts "\nCongrats - YOU WIN!"
        puts ""
    end

    def display_user_loses(solution)
        puts "\n\nOh no ... time up. You lose."
        sleep 0.4
        puts "\nCode was:"
        display_numbers_as_colours(solution)
        puts "\n"
    end

    def get_user_plays_again?
        puts "Play again? (y/n) ..."
        get_valid_yes_or_no == "y"
    end
end