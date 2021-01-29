# frozen_string_literal: true

RSpec.describe Ch02, type: :model do
  let(:klass) { described_class.new }
  let(:txt_path) { File.expand_path('./data/popular-names.txt') }

  describe '#line_count' do
    it { expect(klass.line_count(txt_path)).to match /2780/ }
  end

  describe '#sed' do
    it { expect(klass.sed(txt_path)).not_to match /\t/ }
  end

  describe '#line_one' do
    it { expect(klass.line_one(txt_path)).to match /^Mary\tF\t7065\t1880$/ }
  end

  describe '#line_two' do
    it { expect(klass.line_two(txt_path)).to match /^Anna\tF\t2604\t1880$/ }
  end

  describe '#paste' do
    let(:one) { klass.line_one(txt_path) }
    let(:two) { klass.line_two(txt_path) }

    it { expect(klass.paste(one, two)).to match /^Mary\tF\t7065\t1880\tAnna\tF\t2604\t1880$/ }
  end

  describe '#head' do
    let(:line) { 2 }

    it { expect(klass.head(txt_path, line)).to match /^Mary\tF\t7065\t1880\nAnna\tF\t2604\t1880$/ }
  end

  describe '#tail' do
    let(:line) { 2 }

    it { expect(klass.tail(txt_path, line)).to match /Mason\tM\t12435\t2018\nLogan\tM\t12352\t2018/ }
  end
end