require_relative 'coloured_text'
require_relative 'validation_helper'
#require 'pry'

module Console
    include NumbersToColours
    include ValidationHelper

    def display_welcome_screen
        puts "\nMASTERMIND!"
        puts "Can you crack the code in 12 attempts?"
        # display instructions
        
        print "\nPress Enter/Return to start ..."
        gets 
    end

    def display_all_numbers_and_colours
        puts "\nHere are your colours and their numbers:"
        display_numbers_as_colours([1,2,3,4,5,6])
        puts ""
    end

    def display_numbers_as_colours(numbers)
        numbers.each { |i| print number_to_colour(i) + " " }
        puts ""
        numbers.each { |i| print "  #{i}   " }
    end

    def get_user_guess(current_turn)
        display_all_numbers_and_colours if current_turn == 1
        puts "\nTurn no: #{current_turn}"
        print "Enter your guess ... "
        user_guess = get_valid_user_guess
        user_str_arr = user_guess.split("")
        user_str_arr.map { |c| c = c.to_i}
    end

    def display_feedback(feedback)        
        feedback_string = ""
        token_count = feedback[:close] + feedback[:exact]
        feedback[:exact].times { feedback_string += feedback_exact + " " }
        feedback[:close].times { feedback_string += feedback_close + " " }
        feedback_string = feedback_string.strip
        delay = 0.4
        sleep delay
        print "   ["
        if feedback_string == ""
            sleep delay
            print "no matches"
        else
            feedback_string.each_char do |c|
                sleep delay * token_count / feedback_string.length
                print c
            end
        end
        #sleep delay
        print "]"
        sleep delay
        puts ""
    end

    def display_user_wins  
        puts "\nCongrats - YOU WIN!"
        puts ""
    end

    def display_user_loses(solution)
        puts "\n\nOh no ... time up. You lose."
        sleep 1.5
        puts "\nCode was:"
        display_numbers_as_colours(solution)
        puts "\n"
    end

    def get_user_plays_again?
        puts "Play again? (y/n) ..."
        get_valid_yes_or_no == "y"
    end
end