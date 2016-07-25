module BlackjackHelper

  # Again, the `self` is implicit for `self.text`
  def save_player_hand(player_hand)
    session[:player_hand] = player_hand
  end

  def save_dealer_hand(dealer_hand)
    session[:dealer_hand] = dealer_hand
  end


  def load_player_hand
    session[:player_hand]
  end

  def load_dealer_hand
    session[:dealer_hand]
  end

end