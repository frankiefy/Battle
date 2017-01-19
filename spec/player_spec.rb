require 'player_class'

describe 'Player' do

  context 'initialized values' do
    player1 = Player.new('Frank')
    player2 = Player.new('Alf')
    it 'has a name' do
      expect(player1.name).to eq('Frank')
    end
    it 'has hit points' do
      expect(player1.hit_points).to eq(60)
    end
  end
end
