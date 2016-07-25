require 'sinatra'
require 'erb'
require './lib/deck.rb'

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

  erb :blackjack, :locals => {:player_hand => player_hand, :dealer_hand => dealer_hand}
end



post '/blackjack' do
  player_hand = []
  dealer_hand = [] 
  hit_or_stay = params[:choice]

  if hit_or_stay == "hit"
    deck = Deck.new
    1.times do 
      player_hand<<deck.random
    end
  end
  erb :blackjack, :locals => {:player_hand => player_hand, :dealer_hand => dealer_hand}
end