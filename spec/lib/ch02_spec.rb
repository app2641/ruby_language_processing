# frozen_string_literal: true

RSpec.describe Ch02, type: :model do
  let(:klass) { described_class.new }

  describe '#line_count' do
    let(:txt_path) { File.expand_path('./data/popular-names.txt') }

    it { expect(klass.line_count(txt_path)).to match /2780/ }
  end
end