class BasketballSimulator::CLI

    def call
        greeting
        choice
    end

    def greeting
        puts "Hello, this is the basketball-simulator using https://www.basketball-reference.com/ to help you with all of your basketball needs! Type exit if you want to quit." 
    end

    def choice
        input = nil
        puts "Are you looking for:",
        "1. A specific player from the 2017-2018 NBA season?",  
        "2. Or would you like to play our basketball game?"
        input = gets.strip.downcase
        if input.to_i == 1
            single_player
            goodbye
        elsif input.to_i == 2
            game
            goodbye
        elsif input == "exit"
            goodbye
        else
            puts "Please select either 1 or 2 or exit."
            choice
        end
    end

    def single_player
        input = nil
        input2 = nil
        @players = BasketballSimulator::Player.allplayers
        puts "What player would you like to see? Please be very accurate with spelling and hiphens, etc."
        input = gets.strip.downcase
        @players.each do |player|
            if player.name.downcase == input
                break if player.name.downcase != input 
                puts "Name: #{player.name}", "Height and Weight: #{player.height_and_weight}", "Team: #{player.team}", "Birthday/Birthplace: #{player.birthday_birthplace}", "Points per Game: #{player.points}", "Rebounds per Game: #{player.rebounds}", "Assists per Game: #{player.assists}", "Steals per Game: #{player.steals}", "Blocks per Game: #{player.blocks}", "Field Goal %: #{player.fg}", "3 Point %: #{player.threept}", "Free Throw %: #{player.ft}"
            end
        end
        if input == "exit"
            goodbye
        else
            puts "I don't quite understand, let me try again."
            single_player
        end
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