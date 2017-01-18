require 'sinatra/base'
require './lib/player_class'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/names' do
    $player1 = Player.new(params[:player_1_name])
    $player2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player1.name
    @player_2_name = $player2.name
    @player_1_hp = $player1.hit_points
    @player_2_hp = $player2.hit_points
    erb :play

  end

  get '/attack' do
    @player_1_name = $player1.name
    @player_2_name = $player2.name
    erb :attack
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
