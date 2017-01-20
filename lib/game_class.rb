class Game

  attr_accessor :attack2, :attack1
  attr_reader :player1, :player2

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
  end

  def self.instance
    @current_game
  end

  def self.create(player1,player2)
    @current_game = Game.new(player1,player2)
  end


  def attack2
    @player2.hit_points -= rand(1..10)
    @player1.my_turn = false
    @player2.my_turn = true
  end

  def attack1
    @player1.hit_points -= rand(1..10)
    @player2.my_turn = false
    @player1.my_turn = true
  end

end
