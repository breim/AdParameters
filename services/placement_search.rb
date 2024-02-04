# frozen_string_literal: true

require_relative 'xml_reader'

class PlacementSearch
  def initialize(search)
    @search = search
  end

  def call
    xml_reader = XMLReader.new('./creatives_and_placements.xml')
    xml_reader.read_xml

    creatives = xml_reader.extract_creatives

    find_minimal_creative_price(creatives, @search)
  end

  private

  def find_minimal_creative_price(creatives, search)
    filtered = creatives.filter { |creative| creative[:price] > search[:price].to_f }.min_by { |creative| creative[:price] }
    filtered ? filtered.to_json : { message: 'There is no price lower than the entry value.' }.to_json
  end
end
