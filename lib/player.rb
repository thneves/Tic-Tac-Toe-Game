class Player
  attr_accessor :current_player
  attr_reader :symbol, :turn, :name, :mark_spots
  def initialize(name, symbol, turn)
    @name = "Player #{turn}" if name == ''
    @name = name if name != ''
    @symbol = symbol
    @turn = turn
    @mark_spots = []
  end

  def add_mark(mark)
    @mark_spots = @mark_spots.push(mark)
  end
end
