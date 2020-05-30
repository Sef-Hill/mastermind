module Instructions
    def display_instructions(player_role)
        if player_role == 1
            #GUESS the code
            puts "\nIn this game the computer is a codemaker and you are a codebreaker."
            puts "\nFrom six avilable colours, the computer chooses a 4 colour pattern,\nsome (or none) of which may be duplicates."
            puts "\ne.g. red, green, red, red"
            puts "\nYou have 12 attempts to guess the pattern, in both order and colour."
            puts "After entering each guess you will receive feedback on its accuracy."
            puts "\nThe feedback consists of up to 4 dots (in no particular order):"
            puts "- a solid dot (●) = correct colour in the correct position;"
            puts "- a hollow dot (◯) = correct colour, but in the wrong position."
            puts "\nGood luck and get codebreaking!"
            print "\nPress Enter/Return to start ..."
        gets
        else
            #SET the code
            puts "\nInstructions for setting the code ..."
            puts "\nGood luck!"
            print "\nPress Enter/Return to start ..."
        gets
        end
    end
end