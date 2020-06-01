module ValidationHelper

    def get_valid_yes_or_no
        valid_input = false
        user_input = ""
        until valid_input
            user_input = gets.chomp.downcase
            if user_input == "n" || user_input == "y"
                valid_input = true
            else
                puts "Please enter 'y' or 'n' ..."
            end
        end
        user_input
    end

    def get_valid_four_digits
        valid_input = false
        user_input = ""
        until valid_input
            #get user input, removing any whitespace
            user_input = gets.chomp.gsub(/\s+/, "")
            if user_input.size == 4
                count_valid_digits = 0
                user_input.each_char do |c|
                    if (1..6).include? c.to_i then count_valid_digits += 1 end
                end
                if count_valid_digits == 4
                    valid_input = true
                    next
                end
            end
            puts "That wasn't quite right -"
            puts "please enter a 4 digit number, using digits 1 to 6 ..." 
        end
        user_input
    end

    def get_valid_1_or_2_choice
        valid_input = false
        user_input = ""
        until valid_input
            user_input = gets.chomp
            if user_input == "1" || user_input == "2"
                valid_input = true
            else
                puts "That wasn't quite right -"
                puts "Please enter 1 or 2 ..."
            end
        end
        user_input.to_i
    end
end