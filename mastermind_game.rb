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
                display_all_numbers_and_colours if current_turn == 1
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
end