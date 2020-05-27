require_relative 'coloured_text'
require_relative 'validation_helper'
require 'pry'

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
        # in the form of [••••], green for yes, something else for almost?
        # put in a delay to add tension!
        delay = 0.3
        print "   "
        print "["
        sleep delay
        print "•"
        sleep delay
        print "•"
        sleep delay
        print "•"
        sleep delay
        print "]"
        puts ""
    end

    def display_user_wins
        puts "\n\nCongrats - YOU WIN!"
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