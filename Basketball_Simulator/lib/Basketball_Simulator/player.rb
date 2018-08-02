class BasketballSimulator::Player
    attr_accessor :selector_name, :link, :name, :height, :weight, :team, :birthday, :birthplace, :points, :trebounds, :orebounds, :drebounds, :assists, :steals, :blocks, :fg, :threept, :ft

    @@all = []
    
    def initialize
        @@all << self
    end

    def self.create_players
        BasketballSimulator::Scraper.stats
    end

    def self.all
        @@all
    end

end
