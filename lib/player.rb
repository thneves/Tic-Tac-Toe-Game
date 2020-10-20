# frozen_string_literal: true

class Player
  attr_accessor :name, :symbol, :turn
  def initialize(name, symbol, turn)
    @name = name
    @symbol = symbol
    @turn = turn
  end
end
