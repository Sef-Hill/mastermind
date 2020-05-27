module Instructions
    def display_instructions
        puts "\n"
        puts "Mastermind is a game for 2 players: one is the codemaker, the other is the codebreaker."
        puts "\nIn this game the computer is the codemaker and you are the codebreaker."
        puts "\nFrom the six colours available, the codemaker chooses a pattern of 4 colours,\nsome (or none) of which may be duplicates."
        puts "\ne.g. red, red, blue, green"
        puts "\nThe codebreaker has 12 attempts to guess the pattern, in both order and colour."
        puts "Each turn commences with the codebreaker entering their chosen pattern -"
        puts "in this game, the colours are represented by the numbers 1 to 6"
        puts "- after which they receive feedback from the codemaker on the accuracy of their choice."
        puts "\nThe feedback consists of 0 to 4 symbols:"
        puts "• a solid dot represents a correct colour in the correct position;"
        puts "• a hollow dot represents a correct colour, but in the wrong position."
        puts "\nGood luck and get codebreaking!"
    end
end