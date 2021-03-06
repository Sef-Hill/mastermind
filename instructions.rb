module Instructions
    def display_instructions
        #puts "\n"
        #puts "Mastermind is a game for 2 players: one is the codemaker, the other is the codebreaker."
        puts "\nIn this game the computer is a codemaker and you are a codebreaker."
        puts "\nFrom six avilable colours, the computer chooses a 4 colour pattern,\nsome (or none) of which may be duplicates."
        puts "\ne.g. red, green, red, red"
        puts "\nYou have 12 attempts to guess the pattern, in both order and colour."
        puts "After entering each guess you will receive feedback on its accuracy."
        #puts " on the accuracy of your guess."
        puts "\nThe feedback consists of up to 4 dots (in no particular order):"
        puts "- a solid dot (●) = correct colour in the correct position;"
        puts "- a hollow dot (◯) = correct colour, but in the wrong position."
        puts "\nGood luck and get codebreaking!"
    end
end