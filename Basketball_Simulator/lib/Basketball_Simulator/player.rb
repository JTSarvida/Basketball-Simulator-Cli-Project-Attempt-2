class BasketballSimulator::Player
    attr_accessor :selector_name, :link, :name, :height_and_weight, :team, :birthday_birthplace, :points, :rebounds, :assists, :steals, :blocks, :fg, :threept, :ft

    def self.allplayers
        players = []
        doc = Nokogiri::HTML(open("https://www.basketball-reference.com/leagues/NBA_2018_per_game.html"))

        doc.css('.left[data-stat="player"]').each do |reverse_names|
            player = self.new
            player.selector_name = reverse_names['csk']
            players << player
        end
        players
    end

    def self.player_links
        links = []
        doc = Nokogiri::HTML(open("https://www.basketball-reference.com/leagues/NBA_2018_per_game.html"))

        doc.css('.left[data-stat="player"] a').each do |link|
            links << link['href'] 
        end
        links
    end



    def self.page
        doc = Nokogiri::HTML(open("https://www.basketball-reference.com/#{self.link}"))
    end

        # player_1 = self.new
        # player_1.name = "Russell Westbrook"
        # player_1.height_and_weight = "6-3, 200lb"
        # player_1.team = "Oklahoma City Thunder"
        # player_1.birthday_birthplace = "11/12/1988, Long Beach, California"
        # player_1.points = "25.4"
        # player_1.rebounds = "10.1"
        # player_1.assists = "10.3"
        # player_1.steals = "1.8"
        # player_1.blocks = "0.3"
        # player_1.fg = ".449"
        # player_1.threept = ".298"
        # player_1.ft = ".737"

        # player_2 = self.new
        # player_2.name = "Kevin Durant"
        # player_2.height_and_weight = "6-9, 240lb"
        # player_2.team = "Golden State Warriors"
        # player_2.birthday_birthplace = "9/29/1988, Washington, District of Columbia"
        # player_2.points = "26.4"
        # player_2.rebounds = "6.8"
        # player_2.assists = "5.4"
        # player_2.steals = ".7"
        # player_2.blocks = "1.8"
        # player_2.fg = ".516"
        # player_2.threept = ".419"
        # player_2.ft = ".889"

        # [player_1, player_2]
end
