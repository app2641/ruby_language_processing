# frozen_string_literal: true

RSpec.describe Ch01, type: :model do
  let(:klass) { described_class.new }

  describe '#reverse' do
    let(:str) { 'stressed' }

    it { expect(klass.reverse(str)).to eq 'desserts' }
  end

  describe '#patocar' do
    let(:str) { 'パタトクカシーー' }

    it { expect(klass.patocar(str)).to eq 'パトカー' }
  end

  describe '#patatokucassy' do
    let(:str) { 'パトカー' }
    let(:str2) { 'タクシー' }
    it { expect(klass.patatokucassy(str, str2)).to eq 'パタトクカシーー' }
  end

  describe '#pai' do
    let(:str) { 'Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics.' }
    let(:expected) do
      [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7, 9]
    end

    it { expect(klass.pai(str)).to eq expected }
  end

  describe '#element_symbol' do
    let(:str) { 'Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can.' }
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

    it { expect(klass.element_symbol(str)).to eq expected }
  end

  describe '#n_gram_for_terms' do
    let(:str) { 'I am an NLPer' }
    let(:expected) { [['I', 'am'], ['am', 'an'], ['an', 'NLPer']] }

    it { expect(klass.n_gram_for_terms(str)).to eq expected }
  end

  describe '#n_gram_for_words' do
    let(:str) { 'I am an NLPer' }
    let(:expected) { ['I ', ' a', 'am', 'm ', ' a', 'an', 'n ', ' N', 'NL', 'LP', 'Pe', 'er'] }

    it { expect(klass.n_gram_for_words(str)).to eq expected }
  end

  describe '#union_set' do
    let(:str) { 'paraparaparadise' }
    let(:str2) { 'paragraph' }
    let(:expected) { ['ad', 'ag', 'ap', 'ar', 'di', 'gr', 'is', 'pa', 'ph', 'ra', 'se'] }

    it { expect(klass.union_set(str, str2)).to eq expected }
  end

  describe '#intersection_set' do
    let(:str) { 'paraparaparadise' }
    let(:str2) { 'paragraph' }
    let(:expected) { ['ap', 'ar', 'pa', 'ra'] }

    it { expect(klass.intersection_set(str, str2)).to eq expected }
  end

  describe '#difference_set' do
    let(:str) { 'paraparaparadise' }
    let(:str2) { 'paragraph' }
    let(:expected) { ['ad', 'di', 'is', 'se'] }

    it { expect(klass.difference_set(str, str2)).to eq expected }
  end

  describe '#template' do
    let(:str) { '12' }
    let(:str2) { '気温' }
    let(:str3) { '22.4' }

    it { expect(klass.template(str, str2, str3)).to eq '12時の気温は22.4' }
  end

  describe '#cipher' do
    let(:str) { 'the quick brown fox jumps over the lazy dog' }
    let(:expected) { 'gsv jfrxp yildm ulc qfnkh levi gsv ozab wlt' }

    it { expect(klass.cipher(str)).to eq expected }
    it { expect(klass.cipher(expected)).to eq str }
  end
end