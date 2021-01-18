# frozen_string_literal: true

RSpec.describe Ch01, type: :model do
  let(:klass) { described_class.new }

  describe '#reverse' do
    it { expect(klass.reverse).to eq 'desserts' }
  end

  describe '#patocar' do
    it { expect(klass.patocar).to eq 'パトカー' }
  end

  describe '#patatokucassy' do
    it { expect(klass.patatokucassy).to eq 'パタトクカシーー' }
  end

  describe '#pai' do
    let(:expected) do
      [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9]
    end

    it { expect(klass.pai).to eq expected }
  end

  describe '#element_symbol' do
    let(:expected) do
      {
        'H': 1,
        'He': 2,
        'Li': 3,
        'Be': 4,
        'B': 5,
        'C': 6,
        'N': 7,
        'O': 8,
        'F': 9,
        'Ne':10,
        'Na': 11,
        'Mi': 12,
        'Al': 13,
        'Si': 14,
        'P': 15,
        'S': 16,
        'Cl': 17,
        'Ar': 18,
        'K': 19,
        'Ca': 20
      }
    end

    it { expect(klass.element_symbol).to eq expected }
  end
end