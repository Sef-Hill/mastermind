module Console

    def display_welcome_screen
        puts "MASTERMIND!"
        puts "Can you crack the code in 12 attempts?"
        # display instructions
        # show colours as: numbers 1-6 with coloured backgrounds
        
        print "Press Enter/Return to start ..."
        gets
        display_generating_solution(1.5)
    end

    def display_generating_solution(seconds,fps=10)
        chars = %w[| / - \\]
        delay = 1.0/fps
        print "\nGenerating solution ... "
        (seconds*fps).round.times{ |i|
            print chars[i % chars.length]
            sleep delay
            print "\b"
        }
        puts ""
    end

    def get_user_guess(current_turn)
        puts "\nTurn no: #{current_turn}\nEnter your guess as 4 digits ..."
        user_guess = gets
        #need to validate - should be 4 digit number using nos. 1 - 6
        display_guess_as_colours(user_guess)
    end

    def display_guess_as_colours(user_guess)
    end

    def display_feedback(feedback)
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