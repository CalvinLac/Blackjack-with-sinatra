require 'sinatra'
require 'erb'
require_relative 'deck'

get '/' do
  erb :homepage
end

get '/blackjack' do 
  erb :blackjack
end