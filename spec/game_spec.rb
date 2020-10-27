
require './lib/game.rb'
require './lib/player.rb'

describe Game do
  let(:game) { Game.new }
  describe '#update_board' do
    it 'when valid inputs between 1 - 9' do
      expect(game.update_board('5', 'x')).to eql(true)
    end

    it 'when input not between 1 - 9' do
      expect(game.update_board('10', 'o')).to eql(false)
    end

    it 'when input is not a number' do
      expect(game.update_board('anything', 'x')).to eql(false)
    end
  end

  describe '#change_player' do
    it 'after player 1 make a move' do
      game.current_player = 'player1'
      expect(game.change_player('player1', 'player2')).to eql('player2')
    end

    it 'after player 2 make a move' do
      game.current_player = 'player2'
      expect(game.change_player('player1', 'player2')).to eql('player1')
    end
  end

  describe '#reset_game' do
    let(:game) { Game.new }

    it 'when "Y" reset the game creating new instance of Game object' do
      expect(game.reset_game(game, 'Y')).to be_an(Object)
    end

    it 'when "N" display end message' do
      expect(game.reset_game(game, 'N')).to eql('THANKS FOR PLAYING!')
    end
  end

  describe '#winner_message' do
    let(:game) { Game.new }
    

    it 'display the winner' do
      game.winner
      player1 = Player.new('player1', 'x', 1)
      game.current_player = player1
      expect(game.winner_message(player1)).to eql('player1 IS THE WINNER! CONGRATULATIONS')
    end

    it 'no one won yet' do
      player1 = Player.new('player1', 'x', 1)
      @current_player = player1
      expect(game.winner_message(player1)).to eql("")
    end
  end
end
