class Deck
  
  #Forming the deck for all possible cards
  def initialize
    @possible_cards = [2,3,4,5,6,7,8,9,10,10,10,10,11]
  end

  #Running the sample method to generate a random object from possible cards
  def random
    card_dealt = @possible_cards.sample
  end

end
 
