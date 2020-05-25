require_relative 'console'
require 'pry'

class Mastermind
    include Console

    COLOURS = {
        1 => "blue", 2 => "red", 3 => "green",
        4 => "orange", 5 => "yellow", 6 => "purple"
    }

    def initialize
        display_welcome_screen
        @solution = []
    end

    def set_solution
        max = COLOURS.size
        4.times do
            @solution.push(rand(1..max))
        end        
    end

    def play
        keep_playing = true

        until keep_playing == false
            set_solution
            current_turn = 1
    
            loop do
                user_guess = get_user_guess
                #binding.pry
                if guess_correct?(user_guess)
                    user_wins(current_turn)
                    break
                elsif current_turn == 12
                    user_loses
                    break
                else
                    give_feedback(user_guess)
                    @current_turn += 1
                end
            end
            
            #at end of game
            keep_playing = get_user_plays_again?
        end
    end

    def guess_correct?(user_guess)
        return true
    end

    def give_feedback(user_guess)
    end

    def user_wins(turns_taken)
        #display how many turns they took
        display_user_wins
    end

    def user_loses
        display_user_loses
    end
end