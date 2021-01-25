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
end