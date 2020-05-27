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
                    give_feedback(user_guess)
                    display_user_wins
                    break
                elsif current_turn == 12
                    display_user_loses(@solution)
                    break
                else
                    give_feedback(user_guess)
                end
            end
            keep_playing = get_user_plays_again?
        end
    end

    def give_feedback(user_guess)
        feedback = get_feedback(user_guess)
        display_feedback(feedback)
    end

    def get_feedback(user_guess)
        #exact matches
        solution_copy = @solution.clone
        feedback = {}
        indices = []
        exact_matches = 0
        #count exact matches
        solution_copy.each_with_index do |number, index|
            if user_guess[index] == number
                exact_matches += 1
                indices.push(index)
            end
        end
        feedback[:exact] = exact_matches

        #close matches
        #first, remove exact matches
        indices.reverse!
        indices.each do |i|
            solution_copy.delete_at(i)
            user_guess.delete_at(i)
        end
        #count close matches
        close_matches = 0
        user_guess.each do |number|
            if solution_copy.include?(number)
                #delete 'number' from solution_copy
                solution_copy.delete_at(solution_copy.index(number))
                close_matches += 1
            end
        end
        feedback[:close] = close_matches

        return feedback
    end
end