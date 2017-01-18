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

  context 'changing hp' do
    player1 = Player.new('Frank')
    player2 = Player.new('Alf')
    it 'can attack' do
      expect(player2).to receive(:receive_damage)
      player1.attack(player2)
    end
    it 'can receive damage' do
      player1.attack(player2)
      expect {player2.receive_damage}.to change {player2.hit_points}.by(-10)
    end
  end

end
