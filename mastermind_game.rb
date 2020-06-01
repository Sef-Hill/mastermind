require_relative 'console'
require_relative 'roles'

class Mastermind
    include Console

    def initialize
        display_welcome_screen
        @player_role = get_player_role
        @keep_playing = true
        @solution = []
    end

    def play
        until @keep_playing == false
            player = @player_role == 1 ? Codebreaker.new : Codemaker.new
            player.do_solution(@solution)
            current_turn = 0
            loop do
                current_turn += 1
                guess = player.do_guess(current_turn)
                display_numbers_as_colours(guess)
                player.do_feedback(guess, @solution)
                if guess == @solution
                    player.do_guesser_wins
                    break
                elsif current_turn == 12
                    player.do_guesser_loses(@solution)
                    break
                end
                display_horizontal_rule
            end
            @keep_playing = get_user_plays_again?
            if @keep_playing then @player_role = get_player_role end
        end
    end

    # def give_feedback(user_guess)
    #     feedback = get_feedback(user_guess)
    #     display_feedback(feedback)
    # end

    # def get_feedback(user_guess)
    #     #exact matches
    #     solution_copy = @solution.clone
    #     user_guess_copy = user_guess.clone
    #     feedback = {}
    #     indices = []
    #     exact_matches = 0
    #     #count exact matches
    #     solution_copy.each_with_index do |number, index|
    #         if user_guess[index] == number
    #             exact_matches += 1
    #             indices.push(index)
    #         end
    #     end
    #     feedback[:exact] = exact_matches

    #     #close matches
    #     #first, remove exact matches
    #     indices.reverse!
    #     indices.each do |i|
    #         solution_copy.delete_at(i)
    #         user_guess_copy.delete_at(i)
    #     end
    #     #count close matches
    #     close_matches = 0
    #     user_guess_copy.each do |number|
    #         if solution_copy.include?(number)
    #             #delete 'number' from solution_copy
    #             solution_copy.delete_at(solution_copy.index(number))
    #             close_matches += 1
    #         end
    #     end
    #     feedback[:close] = close_matches

    #     return feedback
    # end
end