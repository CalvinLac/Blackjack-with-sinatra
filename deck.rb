class Deck

  def initialize
    @possible_cards = [2,3,4,5,6,7,8,9,10,11]
  end

  def random
    card_dealt = @possible_cards.sample
  end

end
 