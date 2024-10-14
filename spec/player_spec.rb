# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new('Bob', 'X') }

  describe '#initialize' do
    it 'Creates a player with a name and piece' do
      expect(player.name).to eq('Bob')
      expect(player.piece).to eq('X')
    end
  end

  describe '#make_move' do
    let(:valid_column) { '3' }
    let(:invalid_column) { '8' }

    context 'when valid column is provided' do
      it 'returns the chosen column' do
        allow(player).to receive(:gets).and_return(valid_column)
        expect(player.make_move).to eq(valid_column)
      end
    end

    context 'when invalid column is provided' do
      it 'prompts for input again and returns the chosen column' do
        allow(player).to receive(:gets).and_return(invalid_column, valid_column)
        expect(player.make_move).to eq(valid_column)
      end
    end

    context 'when non-numeric input is provided' do
      it 'prompts for input again and returns the chosen column' do
        allow(player).to receive(:gets).and_return('abc', valid_column)
        expect(player.make_move).to eq(valid_column)
      end
    end
  end
end
