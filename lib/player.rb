class Player
  attr_accessor :current_player, :mark_spots
  attr_reader :symbol, :turn, :name
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
