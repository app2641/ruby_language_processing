# frozen_string_literal: true

RSpec.describe Ch03, type: :model do
  let(:klass) { described_class.new }
  let(:json_path) { File.expand_path('./data/jawiki-country.json.gz') }

  describe '#england' do
    let(:expected) { /\A{{redirect|UK}}/ }

    it { expect(klass.england(json_path)).to match expected }
  end

  describe '#categories' do
    let(:expected) do
      [
        '[[Category:イギリス|*]]',
        '[[Category:イギリス連邦加盟国]]',
        '[[Category:英連邦王国|*]]',
        '[[Category:G8加盟国]]',
        '[[Category:欧州連合加盟国|元]]',
        '[[Category:海洋国家]]',
        '[[Category:現存する君主国]]',
        '[[Category:島国]]',
        '[[Category:1801年に成立した国家・領域]]'
      ]
    end

    it { expect(klass.categories(json_path)).to eq expected }
  end

  describe '#sections' do
    let(:expected) { %w(国名(1) 歴史(1) 地理(1) 主要都市(2) 気候(2) 政治(1)) }

    it { expect(klass.sections(json_path).first(6)).to eq expected }
  end

  describe '#media' do
    let(:expected) do
      [
        "Descriptio Prime Tabulae Europae.jpg",
        "Lenepveu, Jeanne d'Arc au siège d'Orléans.jpg",
        "London.bankofengland.arp.jpg"
      ]
    end

    it { expect(klass.media(json_path).first(3)).to eq expected }
  end

  describe '#emphasis' do
    let(:expected) do
      [
        "神よ女王を護り賜え",
        "2019-2-5閲覧",
        "The American Pageant, Volume 1"
      ]
    end

    it { expect(klass.emphasis(json_path).first(3)).to eq expected }
  end
end