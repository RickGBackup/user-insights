module RandomEvents
  
# Provides nouns and verbs that can be combined to make random event phrases. 
# Used in generating fake DB data in seeds.rb.

  
  def self.random_event
    "#{random_location} #{random_noun} #{random_verb}"
  end
  
  def self.random_location
    locations = ["About", "Home", "FAQ", "Payment", "Back"]
    locations[rand(5)]
  end
  
  def self.random_noun
    nouns = ["button", "page", "link"]
    nouns[rand(3)]
  end
  
  def self.random_verb
    verbs = ["clicked", "hovered over"]
    verbs[rand(2)]
  end
end

