class Alien < ActiveRecord::Base
    has_many :visitations, dependent: :destroy
    has_many :earthlings, through: :visitations

    def visit(earthling)
        # self.visitations.create(date: Date.today, earthling_id: self.earthling)
        Visitation.create(date: Date.today, alien_id: self.id, earthling: earthling)
        # earthling.visitations.create(date: Date.today, alien: self)
    end

    def total_light_years_traveled
        # self.light_years_to_home_planet * self.visitations * 2  
        self.visitations.length * self.light_years_to_home_planet * 2
    end

    def self.most_frequent_visitor
        # compare all of the numbers of visitations, return the alien with the highest number
        self.all.max_by { |alien| alien.visitations.size }
    end

    def self.average_light_years_to_home_planet
        # self.all.sum(light_years_to_home_planet) / self.all.count(:aliens)
        self.all.sum(:light_years_to_home_planet) / self.all.length.to_f
    end


end
