require_relative 'console'
require 'pry'

class Mastermind
    include Console

    def initialize
        display_welcome_screen
        @solution = []
    end

    def set_solution
        @solution.clear
        4.times do
            @solution.push(rand(1..6))
        end        
    end

    def play
        keep_playing = true
        until keep_playing == false
            #game begins
            set_solution
            current_turn = 0
    
            loop do
                current_turn += 1
                user_guess = get_user_guess(current_turn)
                display_numbers_as_colours(user_guess)
                if user_guess == @solution
                    display_user_wins
                    break
                elsif current_turn == 12
                    display_user_loses
                    break
                else
                    feedback = get_feedback(user_guess)
                    display_feedback(feedback)
                end
            end
            keep_playing = get_user_plays_again?
        end
    end

    def get_feedback(user_guess)
        return {:exact => 1, :close => 2}
    end
end