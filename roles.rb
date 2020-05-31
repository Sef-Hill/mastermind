require_relative 'console'

class Codebreaker
    include Console
    def do_solution(solution)
        solution.clear
        4.times do
            solution.push(rand(1..6))
        end
    end

    def do_guess(current_turn)
        get_user_guess(current_turn)
    end

    def do_feedback(user_guess, solution)
        #calculate exact matches
        solution_copy = solution.clone
        user_guess_copy = user_guess.clone
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

        #calculate close matches
        #first, remove exact matches
        indices.reverse!
        indices.each do |i|
            solution_copy.delete_at(i)
            user_guess_copy.delete_at(i)
        end
        #count close matches
        close_matches = 0
        user_guess_copy.each do |number|
            if solution_copy.include?(number)
                #delete 'number' from solution_copy
                solution_copy.delete_at(solution_copy.index(number))
                close_matches += 1
            end
        end
        feedback[:close] = close_matches
        display_feedback(feedback)
    end

    def do_guesser_wins
        display_user_wins
    end

    def do_guesser_loses(solution)
        display_user_loses
    end
end

class Codemaker
    def do_solution(solution)

    end

    def do_guess(current_turn)

    end

    def do_feedback(guess, solution)

    end

    def do_guesser_wins

    end

    def do_guesser_loses(solution)
    end
end