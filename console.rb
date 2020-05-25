module Console

    def display_welcome_screen
        puts "MASTERMIND!"
        puts "Can you crack the code in 12 attempts?\n"
        # display instructions
        # show colours as: numbers 1-6 with coloured backgrounds
    end

    def get_user_guess(current_turn)
        #needs to be a 4 digit number
        puts "\nTurn no: #{current_turn}\nEnter your guess ..."
        gets
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
            puts "\nPlay again? (y/n) ..."
            user_input = gets.chomp.downcase
            if user_input == "n" || user_input == "y"
                valid_input = true
            else
                puts "\nPlease enter 'y' or 'n'"
            end
        end
        user_input == "y"
    end
end