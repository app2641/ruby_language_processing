# frozen_string_literal: true

RSpec.describe Ch02, type: :model do
  let(:klass) { described_class.new }
  let(:txt_path) { File.expand_path('./data/popular-names.txt') }

  describe '#line_count' do
    let(:expected) { `cat #{txt_path} | wc -l | sed -e 's/\s//g'` }

    it { expect("#{klass.line_count(txt_path)}\n").to eq expected }
  end

  describe '#replace_tab_to_space' do
    it { expect(klass.replace_tab_to_space(txt_path)).not_to match /\t/ }
  end

  describe '#line_one' do
    let(:expected) { `cat #{txt_path} | head -n 1` }

    it { expect(klass.line_one(txt_path)).to eq expected }
  end

  describe '#line_two' do
    let(:expected) { `cat #{txt_path} | head -n 2 | tail -n 1` }

    it { expect(klass.line_two(txt_path)).to match /^Anna\tF\t2604\t1880$/ }
  end

  describe '#paste' do
    let(:one) { klass.line_one(txt_path) }
    let(:two) { klass.line_two(txt_path) }

    it { expect(klass.paste(one, two)).to match /^Mary\tF\t7065\t1880\tAnna\tF\t2604\t1880$/ }
  end

  describe '#head' do
    let(:line) { 2 }
    let(:expected) { `head -n #{line} #{txt_path}` }

    it { expect(klass.head(txt_path, line)).to eq expected }
  end

  describe '#tail' do
    let(:line) { 2 }
    let(:expected) { `tail -n #{line} #{txt_path}` }

    it { expect(klass.tail(txt_path, line)).to eq expected }
  end

  describe '#beginning_of_line' do
    let(:expected) { `cut -b 1 #{txt_path} | sort | uniq` }

    it { expect(klass.beginning_of_line(txt_path)).to eq expected }
  end

  describe '#sort_third' do
    let(:expected) { `sort -rnk 3 #{txt_path} | head -n 3` }

    it { expect(klass.sort_third(txt_path)).to eq expected }
  end

  describe '#count' do
    let(:expected) do
      <<~TXT
\s118 James
\s111 William
\s108 Robert
      TXT
    end

    it { expect(klass.count(txt_path)).to eq expected }
  end
end