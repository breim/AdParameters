# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require './lib/currency_converter'

class XMLReader
  def initialize(xml_path)
    @xml_path = xml_path
  end

  def read_xml
    file = File.open(@xml_path)
    @doc = Nokogiri::XML(file) { |config| config.strict.noblanks }
  end

  def extract_creatives
    @doc.xpath('//Creative').map do |creative|
      {
        id: creative['id'],
        price: convert_to_eur(creative['price'], creative['currency'])
      }
    end
  end

  def self.extract_placements
    @doc.xpath('//Placement').map do |placement|
      {
        id: placement['id'],
        floor_price: convert_to_eur(placement['floor'], placement['currency'])
      }
    end
  end

  private

  def convert_to_eur(price, currency)
    CurrencyConverter.convert_to_eur(price, currency)
  end
end
