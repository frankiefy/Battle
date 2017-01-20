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

  get '/attack2' do
    if $player1.my_turn == true
      $player2.hit_points -= rand(1..10)
      $player1.my_turn = false
      $player2.my_turn = true
      if $player2.hit_points > 0
        redirect '/play'
      else
        redirect '/1winner'
      end
    else
      redirect '/play'
    end
  end

  get '/attack1' do
    if $player2.my_turn == true
      $player1.hit_points -= rand(1..10)
      $player2.my_turn = false
      $player1.my_turn = true
      if $player1.hit_points > 0
        redirect '/play'
      else
        redirect '/2winner'
      end
    elsif $player2.my_turn == false
      redirect '/play'
    end
  end

  get '/1winner' do
    @player_1_name = $player1.name
    erb :one_wins
  end

  get '/2winner' do
    @player_2_name = $player2.name
    erb :two_wins
  end





  # start the server if ruby file executed directly
  run! if app_file == $0
end
