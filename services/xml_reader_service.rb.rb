# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

class XMLReaderService
  def initialize(xml_path)
    @xml_path = xml_path
  end

  def read_xml
    file = File.open(@xml_path)
    @doc = Nokogiri::XML(file) { |config| config.strict.noblanks }
  end

  def extract_creatives
    @doc.xpath('//Creative')
  end

  def extract_placements
    @doc.xpath('//Placement')
  end
end
