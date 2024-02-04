# frozen_string_literal: true

RSpec.describe PlacementSeqGenerator do
  describe '.call' do
    let(:xml_path) { 'spec/fixtures/creatives_and_placements.xml' }

    it 'generates a hex encoded message from XML input' do
      hex_encoded_message = described_class.call(xml_path)

      expect(hex_encoded_message).to be_a(String)
      expect(hex_encoded_message.length).to be > 0
    end
  end
end
