class Player
  attr_accessor :name, :mark_spots, :current_player
  attr_reader :symbol, :turn
  def initialize(name, symbol, turn)
    @name = name
    @symbol = symbol
    @turn = turn
    @mark_spots = []
  end

  def add_mark(mark)
    @mark_spots = @mark_spots.push(mark)
  end
end
