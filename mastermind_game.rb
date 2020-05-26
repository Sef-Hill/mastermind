require_relative 'console'
require 'pry'

class Mastermind
    include Console

    def initialize
        display_welcome_screen
        @solution = []
    end

    def set_solution
        4.times do
            @solution.push(rand(1..6))
        end        
    end

    def play
        keep_playing = true
        until keep_playing == false
            set_solution
            current_turn = 0
    
            loop do
                current_turn += 1
                user_guess = get_user_guess(current_turn)
                display_numbers_as_colours(user_guess)
                #show all previous turns and their feedback?
                if guess_correct?(user_guess)
                    display_user_wins
                    break
                elsif current_turn == 12
                    display_user_loses
                    break
                else
                    give_feedback(user_guess)
                end
            end
            keep_playing = get_user_plays_again?
        end
    end

    def guess_correct?(user_guess)
        #compare user_guess to @solution
        return false
    end

    def give_feedback(user_guess)
        #put in a delay here
        puts "[••••]"
    end
end