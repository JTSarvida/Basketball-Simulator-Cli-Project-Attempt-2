class BasketballSimulator::CLI

    def initial_call
        player_database
        greeting
        choice
    end

    def call
        greeting
        choice
    end

    def player_database
        puts "Please wait while we load up our database."
        @players = BasketballSimulator::Player.create_players
        puts ""
    end
    
    def greeting
        puts "Hello, this is the basketball-simulator using https://www.basketball-reference.com/ to help you with all of your basketball needs! Type exit if you want to quit." 
        puts ""
    end

    def choice
        input = nil
        puts "Are you looking for:",
        "1. A specific player from the 2017-2018 NBA season?",  
        "2. Or would you like to play our basketball game?",
        ""
        input = gets.strip.downcase
        case input
        when "1"
            single_player
        when "2"
            game
            goodbye
        when "exit"
            goodbye
        else
            puts "Please select either 1 or 2 or exit."
            choice
        end

        ## Switch from if statement to case statement
    end

    def single_player
        input = nil
        puts ""
        puts "What player would you like to see?"
        puts ""
        input = gets.strip.downcase
        if input == "exit"
            puts ""
            goodbye
        end
        @chosen_player = @players.detect {|player| player.name.downcase == input}
        if @chosen_player
            puts ""
            puts "Name: #{@chosen_player.name}", "Height: #{@chosen_player.height}", "Weight: #{@chosen_player.weight}", "Team: #{@chosen_player.team}", "Birthday: #{@chosen_player.birthday}", "Birthplace: #{@chosen_player.birthplace}", "Points per Game: #{@chosen_player.points}", "Total Rebounds per Game: #{@chosen_player.trebounds}", "Offensive Rebounds per Game: #{@chosen_player.orebounds}", "Defensive Rebounds per Game: #{@chosen_player.drebounds}", "Assists per Game: #{@chosen_player.assists}", "Steals per Game: #{@chosen_player.steals}", "Blocks per Game: #{@chosen_player.blocks}", "Field Goal %: #{@chosen_player.fg}", "3 Point %: #{@chosen_player.threept}", "Free Throw %: #{@chosen_player.ft}"
            goodbye
        else
            single_player_mistake
        end
    end

    def single_player_mistake
        input2 = nil
        puts "Whoops, that didn't work. Would you like to try again?"
        puts ""
        input2 = gets.strip.downcase
        if input2 == "y"
            single_player
        elsif input2 == "n"
            puts "Thanks again, have a great day!"
        else 
            puts "What did you say? Please be very specific in spelling."
            puts ""
            single_player
        end
    end

    def game
        # puts "Please enter 5 player names"
        # puts "Please enter another 5 names"
        puts "This feature will be available in a future update."
        goodbye
    end

    def goodbye
        puts "Thank you for using this application today. Would you like to go again? Y/N?"
        puts ""
        input = gets.strip.downcase
        if input == "y"
            puts ""
            call
        elsif input == "n"
            puts ""
            puts "Thanks again, have a great day!"
        else 
            puts ""
            puts "What did you say? Please be very specific in spelling."
            goodbye
        end
    end

end