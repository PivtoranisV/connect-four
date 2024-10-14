# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new('Bob', 'X') }
  describe '#initialize' do
    it 'Creates player with name and piece' do
      expect(player.name).to eq('Bob')
      expect(player.piece).to eq('X')
    end
  end

  describe '#make_move' do
    context 'when valid move is entered' do
      it 'returns the chosen column number' do
        allow(player).to receive(:gets).and_return('1')

        expect(player.make_move).to eq('1')
      end
    end
  end
end
