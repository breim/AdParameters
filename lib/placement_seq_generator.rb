# frozen_string_literal: true

require_relative '../services/xml_reader'
require_relative '../services/placement_matcher'
require_relative 'creative_placement_definitions_pb'

class PlacementSeqGenerator
  def self.call(xml_path)
    new(xml_path).send(:generate_sequence)
  end

  private

  attr_reader :xml_path

  def initialize(xml_path)
    @xml_path = xml_path
  end

  def generate_sequence
    xml_reader = XMLReader.new(xml_path)
    xml_reader.read_xml

    creatives = xml_reader.extract_creatives
    placements = xml_reader.extract_placements

    matcher = PlacementMatcher.new(creatives, placements).match

    placements_sequence = matcher.map do |placement|
      creatives = placement[:creatives].map do |creative|
        FYBER::Userconfiguration::Creative.new(id: creative[:id], price: creative[:price])
      end

      FYBER::Userconfiguration::Placement.new(id: placement[:id], creative: creatives)
    end

    placement_seq = FYBER::Userconfiguration::PlacementSeq.new(placement: placements_sequence)

    encoded_message = FYBER::Userconfiguration::PlacementSeq.encode(placement_seq)
    encoded_message.unpack1('H*')
  end
end
