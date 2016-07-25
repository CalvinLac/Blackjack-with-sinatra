require 'sinatra'
require 'erb'
require './helpers/blackjack_helper.rb'
require './lib/deck.rb'

helpers BlackjackHelper
enable :sessions

get '/' do
  erb :homepage
end



get '/blackjack' do 
  deck = Deck.new
  player_hand = []
  dealer_hand = []
  2.times do
    player_hand<<deck.random
  end

  1.times do
    dealer_hand<<deck.random
  end

  sum_of_player_hand = player_hand.inject(:+)
  sum_of_dealer_hand = dealer_hand.inject(:+)

  save_player_hand(player_hand)
  save_dealer_hand(dealer_hand)

  erb :blackjack, :locals => {:player_hand => player_hand, :dealer_hand => dealer_hand,
                                :sum_of_player_hand => sum_of_player_hand, :sum_of_dealer_hand => sum_of_dealer_hand }
end



post '/blackjack' do
  player_hand = load_player_hand
  dealer_hand = load_dealer_hand 
  hit_or_stay = params[:choice]
  deck = Deck.new

  if hit_or_stay == "hit"
    1.times do 
      player_hand<<deck.random
    end
  end

  if hit_or_stay == "stay"
    unless dealer_hand.inject(:+) >= 17
      dealer_hand<<deck.random
    end
  end

  sum_of_player_hand = player_hand.inject(:+)
  sum_of_dealer_hand = dealer_hand.inject(:+)

  if sum_of_player_hand > 21
    erb :busted
  else
    erb :blackjack, :locals => {:player_hand => player_hand, :dealer_hand => dealer_hand,
                                :sum_of_player_hand => sum_of_player_hand, :sum_of_dealer_hand => sum_of_dealer_hand }
  end

end