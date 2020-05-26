require_relative 'coloured_text'
#require 'pry'

module Console
    include NumbersToColours

    def display_welcome_screen
        puts "\nMASTERMIND!"
        puts "Can you crack the code in 12 attempts?"
        # display instructions
        # show colours as: numbers 1-6 with coloured backgrounds
        puts "\nYour choice of colours (and their numbers) is:"
        
        #display_coloured_pegs([1, 2, 3, 4, 5, 6])
        for i in 1..6
            print number_to_colour(i) + " "
        end
        puts ""
        for i in 1..6
            print "  #{i}   "
        end

        print "\nPress Enter/Return to start ..."
        gets
        display_generating_solution(1.5)
    end

    def display_generating_solution(seconds,fps=10)
        chars = %w[| / - \\]
        delay = 1.0/fps
        print "\nGenerating solution: "
        (seconds*fps).round.times{ |i|
            print chars[i % chars.length]
            sleep delay
            print "\b"
        }
        puts ""
    end

    def get_user_guess(current_turn)
        #show all available colours
        #show all previous turns and their feedback

        puts "\nTurn no: #{current_turn}\nEnter your guess as 4 digits ..."
        user_guess = gets
        #need to validate - should be 4 digit number using nos. 1 - 6
        #convert to array

        #for each number, display peg
    end

    def display_coloured_peg(peg_number)
        print number_to_peg(peg_number)
    end

    def display_feedback(feedback)
        # in the form of [••••], green for yes, something else for almost?
    end

    def display_user_wins
        puts "Congrats - YOU WIN!"
    end

    def display_user_loses
        puts "Oh no ... time up. You lose."
    end

    def display_solution(solution)
    end

    def get_user_plays_again?
        valid_input = false
        user_input = ""
        until valid_input
            puts "Play again? (y/n) ..."
            user_input = gets.chomp.downcase
            if user_input == "n" || user_input == "y"
                valid_input = true
            else
                puts "Please enter 'y' or 'n' ..."
            end
        end
        user_input == "y"
    end
end