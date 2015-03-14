require 'game'

describe 'Game' do 
  let(:game){Game.new}
  let(:player){double :player, :selection=>:scissors}
  let(:computer){double :computer, :selection=>:scissors}

  def set_players
    game.player1 = player
    game.player2 = computer
  end  

  it 'knows when it is a draw' do   
    set_players
    expect(game.determine_winner).to eq(:draw)       
  end  

  it 'knows that rock beats lizard and scissors' do 
    set_players
    allow(player).to receive(:selection) { :rock }
    allow(computer).to receive(:selection) { :lizard }
    expect(game.determine_winner).to eq(player)
    allow(player).to receive(:selection) { :scissors }
    allow(computer).to receive(:selection) { :rock }
    expect(game.determine_winner).to eq(computer)
  end  

  it 'knows that paper beats spock and rock' do 
    set_players
    allow(player).to receive(:selection) { :paper }
    allow(computer).to receive(:selection) { :spock }
    expect(game.determine_winner).to eq(player)
    allow(player).to receive(:selection) { :rock }
    allow(computer).to receive(:selection) { :paper }
    expect(game.determine_winner).to eq(computer)
  end  

  it 'knows that scissors beats lizard and paper' do 
    set_players
    allow(player).to receive(:selection) { :scissors }
    allow(computer).to receive(:selection) { :lizard }
    expect(game.determine_winner).to eq(player)
    allow(player).to receive(:selection) { :paper }
    allow(computer).to receive(:selection) { :scissors }
    expect(game.determine_winner).to eq(computer)
  end  

  it 'knows that spock beats rock and scissors' do 
    set_players
    allow(player).to receive(:selection) { :spock }
    allow(computer).to receive(:selection) { :rock }
    expect(game.determine_winner).to eq(player)
    allow(player).to receive(:selection) { :scissors }
    allow(computer).to receive(:selection) { :spock }
    expect(game.determine_winner).to eq(computer)
  end  

  it 'knows that lizard beats paper and spock' do 
    set_players
    allow(player).to receive(:selection) { :lizard }
    allow(computer).to receive(:selection) { :paper }
    expect(game.determine_winner).to eq(player)
    allow(player).to receive(:selection) { :spock }
    allow(computer).to receive(:selection) { :lizard }
    expect(game.determine_winner).to eq(computer)
  end  

end 