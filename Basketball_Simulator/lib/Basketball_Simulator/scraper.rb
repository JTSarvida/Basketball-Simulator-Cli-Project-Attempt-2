class BasketballSimulator::Scraper
    attr_accessor :selector_name, :link, :name, :height, :weight, :team, :birthday, :birthplace, :points, :trebounds, :orebounds, :drebounds, :assists, :steals, :blocks, :fg, :threept, :ft

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
            player.height = doc.css('span[itemprop="height"]').text
            player.weight = doc.css('span[itemprop="weight"]').text
            player.team = doc.css('.left[data-stat="team_id"] a')[0].text
            player.birthday = doc.css('span[itemprop="birthDate"]')[0]["data-birth"]
            player.birthplace = doc.css('span[itemprop="birthPlace"] a')[0].text
            player.points = doc.css('tr[id="per_game.2018"]').css('.right[data-stat="pts_per_g"]').text
            player.trebounds = doc.css('tr[id="per_game.2018"]').css('.right[data-stat="trb_per_g"]').text
            player.orebounds = doc.css('tr[id="per_game.2018"]').css('.right[data-stat="orb_per_g"]').text
            player.drebounds = doc.css('tr[id="per_game.2018"]').css('.right[data-stat="drb_per_g"]').text
            player.assists = doc.css('tr[id="per_game.2018"]').css('.right[data-stat="ast_per_g"]').text
            player.steals = doc.css('tr[id="per_game.2018"]').css('.right[data-stat="stl_per_g"]').text
            player.blocks = doc.css('tr[id="per_game.2018"]').css('.right[data-stat="blk_per_g"]').text
            player.fg = doc.css('tr[id="per_game.2018"]').css('.right[data-stat="fg_pct"]').text
            player.threept = doc.css('tr[id="per_game.2018"]').css('.right[data-stat="fg3_pct"]').text
            player.ft = doc.css('tr[id="per_game.2018"]').css('.right[data-stat="ft_pct"]').text
        end 
    end
end
