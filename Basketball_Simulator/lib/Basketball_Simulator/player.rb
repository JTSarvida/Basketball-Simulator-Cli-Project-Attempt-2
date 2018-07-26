class BasketballSimulator::Player
    attr_accessor :name, :height_and_weight, :team, :birthday_birthplace, :points, :rebounds, :assists, :steals, :blocks, :fg, :threept, :ft

    def self.allplayers
        players = []

        doc = Nokogiri::HTML(open("https://www.basketball-reference.com/leagues/NBA_2018_per_game.html"))

        doc.css('.left[data-stat="player"]').each do |player|
            players << player.css(".player a") 
        end
        players

        
    end


end
