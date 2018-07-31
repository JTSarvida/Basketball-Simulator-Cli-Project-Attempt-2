class BasketballSimulator::Player
    attr_accessor :selector_name, :link, :name, :height_and_weight, :team, :birthday_birthplace, :points, :rebounds, :assists, :steals, :blocks, :fg, :threept, :ft
    
    def self.allplayers

    end

    def self.allplayersnames
        players = []
        doc = Nokogiri::HTML(open("https://www.basketball-reference.com/leagues/NBA_2018_per_game.html"))

        doc.css('.left[data-stat="player"]').each do |reverse_names|
            player = BasketballSimulator::Player.new
            player.selector_name = reverse_names['csk']
            players << player
        end
        players
    end

    def self.allplayer_links
        players = self.allplayersnames
        links = []
        x = 0
        doc = Nokogiri::HTML(open("https://www.basketball-reference.com/leagues/NBA_2018_per_game.html"))

        doc.css('.left[data-stat="player"] a').each do |link|
            links << "https://www.basketball-reference.com#{link['href']}" 
        end
        players.each do |player|
            player.link = "#{links[x]}"
            x += 1
        end
        players
    end



    def self.stats
        players = self.allplayer_links
        players.each do |player|
            doc = Nokogiri::HTML(open(player.link))
            player.name = doc.css('h1[itemprop="name"]').text
        end
        players[0]
        # players = self.allplayer_links
        # doc = Nokogiri::HTML(open(players[0].link))
        # players[0].name = doc.css('h1[itemprop="name"]').text
        # players[0]
        binding.pry
    end


        
end
