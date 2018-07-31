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
        @players = BasketballSimulator::Player.allplayers
        puts "What player would you like to see? LastName,FirstName format please."
        input = gets.strip.downcase
        if input == "exit"
            goodbye
        end
        @chosen_player = @players.detect {|player| player.name == input}
        if @chosen_player
            puts "Name: #{@chosen_player.name}", "Height and Weight: #{@chosen_player.height_and_weight}", "Team: #{@chosen_player.team}", "Birthday/Birthplace: #{@chosen_player.birthday_birthplace}", "Points per Game: #{@chosen_player.points}", "Rebounds per Game: #{@chosen_player.rebounds}", "Assists per Game: #{@chosen_player.assists}", "Steals per Game: #{@chosen_player.steals}", "Blocks per Game: #{@chosen_player.blocks}", "Field Goal %: #{@chosen_player.fg}", "3 Point %: #{@chosen_player.threept}", "Free Throw %: #{@chosen_player.ft}"
            goodbye
        else
            single_player_mistake
        end
    end

    def single_player_mistake
        input2 = nil
        puts "Whoops, that didn't work. Would you like to try again?"
        input2 = gets.strip.downcase
        if input2 == "y"
            single_player
        elsif input2 == "n"
            puts "Thanks again, have a great day!"
        else 
            puts "What did you say? Please be very specific in spelling."
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