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

  describe 'pai' do
    let(:expected) do
      [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9]
    end

    it { expect(klass.pai).to eq expected }
  end
end