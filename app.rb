require 'sinatra'
require 'erb'

get '/' do
  erb :homepage
end

get '/blackjack' do 
  erb :blackjack
end