require 'pry'

class Owner
  # code goes here
  @@all = []
  @@count = 0

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
    @@count += 1
    @pets = {:cats => [], :dogs => [], :fishes => []}
  end



  def say_species
    "I am a #{@species}."
  end


  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish

  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def walk_dogs
    self.pets[:dogs].each {|dog| dog.mood = 'happy'}
  end

  def play_with_cats
    self.pets[:cats].each {|cat| cat.mood = 'happy'}
  end

  def feed_fish
    self.pets[:fishes].each {|fish| fish.mood = 'happy'}
  end

  def sell_pets
    self.pets.each do |animal, list|
      list.each do |pet|
        pet.mood = 'nervous'
      end
    end
    @pets.clear
  end

  def list_pets
    fish_count = self.pets[:fishes].length
    cat_count = self.pets[:cats].length
    dog_count = self.pets[:dogs].length
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end
