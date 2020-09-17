class Owner
  attr_reader :name, :species 
  @@all = []
  def initialize (name)
    @species = "human"
    @name = name
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all 
  end

  def self.count
    @@all.count 
  end

  def self.reset_all
    @@all = []
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def cats
    Cat.all.filter {|cat_instance| cat_instance.owner == self}
  end

  def dogs
    Dog.all.filter {|dog_instance| dog_instance.owner == self}
  end

  def walk_dogs
    self.dogs.map {|dog| dog.mood = 'happy'}
  end

  def feed_cats
    self.cats.map {|cat| cat.mood = 'happy'}
  end

  def sell_pets
    self.cats.map {|cat| cat.mood = 'nervous'}
    self.dogs.map {|dogs| dogs.mood = 'nervous'}
    self.cats.map {|cat| cat.owner = nil}
    self.dogs.map {|dogs| dogs.owner = nil}
  end

  # def list_pets 
  # list = []    
  #   self.cats.each do |cat|
  #     list << cat
  #   end
  #   self.dogs.each do |dog|
  #     list << dog
  #   end
  #   list
  #end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end