require './lib/player.rb'

describe Player do
  let(:player1) { Player.new('player1', 'x', 1 )}

  describe '#add_mark' do
    it 'push mark into an array' do
      expect(player1.add_mark('5')).to eql(['5'])
    end
  end
end
