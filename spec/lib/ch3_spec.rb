# frozen_string_literal: true

RSpec.describe Ch03, type: :model do
  let(:klass) { described_class.new }
  let(:json_path) { File.expand_path('./data/jawiki-country.json.gz') }

  describe '#england' do
    let(:expected) { /\A{{redirect|UK}}/ }

    it { expect(klass.england(json_path)).to match expected }
  end
end