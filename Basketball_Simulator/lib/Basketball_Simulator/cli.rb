class BasketballSimulator::CLI

    def call
        greeting
        choice
        goodbye
    end

    def greeting
        puts "Hello, this is the basketball-simulator using https://www.basketball-reference.com/ to help you with all of your basketball needs! Type exit if you want to quit." 
    end

    def choice
        input = nil
        puts "Are you looking for:",
        "1. A specific player from the 2017-2018 NBA season?",  
        "2. Or would you like to play our basketball game?"
        while input != "exit"
            input = gets.strip.downcase
            if input.to_i == 1
                player
            elsif input.to_i == 2
                game
            else
                puts "Please select either 1 or 2 or exit."
            end
        end
    end

    def player
        puts "What player would you like to see?"
    end

    def game
        puts "Please enter 5 player names"
        puts "Please enter another 5 names"
    end

    def goodbye
        puts "Thank you for using this application today. Would you like to go again? Y/N?"
        input = gets.strip.downcase
        if input == "y"
            call
        elsif input == "n"
            puts "Thanks again, have a great day!"
        else 
            puts "What did you say? Please be very specific in spelling."
            goodbye
        end
    end
end