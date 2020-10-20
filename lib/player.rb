# frozen_string_literal: true

class Player
  attr_accessor :name, :symbol, :turn, :mark_spots
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
