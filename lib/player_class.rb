class Player

  attr_accessor :name, :hit_points, :my_turn

  def initialize(name, hit_points = 60, my_turn = true)
    @name = name.capitalize
    @hit_points = hit_points
    @my_turn = my_turn
  end


end
