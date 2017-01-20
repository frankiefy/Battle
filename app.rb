require 'sinatra/base'
require './lib/player_class'
require './lib/game_class'


class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  before do
    @current_game = Game.instance
  end

  post '/names' do
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    @current_game = Game.create(player1,player2)
    redirect '/play'
  end

  get '/play' do
    @player_1_name = @current_game.player1.name
    @player_2_name = @current_game.player2.name
    @player_1_hp = @current_game.player1.hit_points
    @player_2_hp = @current_game.player2.hit_points
    erb :play
  end

  get '/attack2' do
    if @current_game.player1.my_turn == true
      @current_game.attack2
    else
      redirect '/play'
    end
    if @current_game.player2.hit_points > 0
      redirect '/play'
    else
      redirect '/1winner'
    end
  end

  get '/attack1' do
    if @current_game.player2.my_turn == true
      @current_game.attack1
    else
      redirect '/play'
    end
    if @current_game.player1.hit_points > 0
      redirect '/play'
    else
      redirect '/2winner'
    end
  end

  get '/1winner' do
    @player_1_name = @current_game.player1.name
    erb :one_wins
  end

  get '/2winner' do
    @player_2_name = @current_game.player2.name
    erb :two_wins
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
