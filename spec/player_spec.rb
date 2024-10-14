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
end
