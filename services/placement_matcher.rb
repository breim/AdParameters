# frozen_string_literal: true

class PlacementMatcher
  def initialize(creatives, placements)
    @creatives = creatives
    @placements = placements
  end

  def match
    @placements.each do |placement|
      placement[:creatives] = filter_creatives_for_placement(placement)
    end
  end

  private

  def filter_creatives_for_placement(placement)
    @creatives.filter do |creative|
      creative_meets_floor_price?(creative, placement)
    end
  end

  def creative_meets_floor_price?(creative, placement)
    creative[:price] >= placement[:floor_price]
  end
end
