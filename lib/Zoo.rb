require "./Animal.rb"
require "pry"

class Zoo
    attr_accessor :location, :name

    @@all = []

    def initialize(name, location)
         @name = name
         @location = location 
         @@all << self  
    end

    def self.all
        @@all
    end

    def animals
        Animal.all.select do |animal|
            animal.zoo == self
        end
    end

    def animal_species
        unique_species = []
        self.animals.each do |animal|
            unique_species << animal.species
        end
        unique_species.uniq 
    end

    def find_by_species(species)
        self.animals.select do |animal|
            animal.species == species
        end
    end

    def animal_nicknames
        nicknames = []
        self.animals.each do |animal|
            nicknames << animal.nickname
        end 
        nicknames
    end

    def self.find_by_location(location)
        @@all.select do |zoo|
            zoo.location == location
        end
    end

end

bronx_zoo = Zoo.new("Bronx Zoo", "NY")
queens_zoo = Zoo.new("Queens Zoo", "NJ")
brooklyn_zoo = Zoo.new("Brooklyn Zoo", "NY")

buggy = Animal.new("insect", 2, "buggy")
bug2 = Animal.new("insect", 3, "beetle")
bird = Animal.new("bird", 3, "Tucam Sam")

buggy.zoo = bronx_zoo
bug2.zoo = bronx_zoo
bird.zoo = bronx_zoo

binding.pry

# Code below will establish a connection between the Animal class and Zoo class
# buggy.zoo = bronx_zoo 