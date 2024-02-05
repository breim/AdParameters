# frozen_string_literal: true

RSpec.describe XMLReader do
  let(:xml_path) { 'spec/fixtures/creatives_and_placements.xml' }
  subject(:xml_reader) { described_class.new(xml_path) }

  before do
    allow(CurrencyConverter).to receive(:convert_to_eur).and_return(10.0)
  end

  describe '#read_xml' do
    it 'reads and parses the XML file' do
      expect { xml_reader.read_xml }.not_to raise_error
    end
  end

  describe '#extract_creatives' do
    it 'extracts creatives from XML' do
      xml_reader.read_xml
      expect(xml_reader.extract_creatives).to all(include(:id, :price))
    end
  end

  describe '#extract_placements' do
    it 'extracts placements from XML' do
      xml_reader.read_xml
      expect(xml_reader.extract_placements).to all(include(:id, :floor_price))
    end
  end
end
