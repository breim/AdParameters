# frozen_string_literal: true

RSpec.describe PlacementMatcher do
  describe '#match' do
    let(:creatives) do
      [
        { id: 1, price: 10 },
        { id: 2, price: 20 },
        { id: 3, price: 5 }
      ]
    end
    let(:placements) do
      [
        { id: 'a', floor_price: 15, creatives: [] },
        { id: 'b', floor_price: 5, creatives: [] }
      ]
    end

    before do
      described_class.new(creatives, placements).match
    end

    it 'filters creatives that meet the floor price for each placement' do
      expect(placements.find { |p| p[:id] == 'a' }[:creatives]).to match_array([{ id: 2, price: 20 }])
      expect(placements.find { |p| p[:id] == 'b' }[:creatives]).to match_array([{ id: 1, price: 10 }, { id: 2, price: 20 }, { id: 3, price: 5 }])
    end

    it 'assigns no creatives to placements where none meet the floor price' do
      placement_c = { id: 'c', floor_price: 25, creatives: [] }
      described_class.new(creatives, [placement_c]).match

      expect(placement_c[:creatives]).to be_empty
    end
  end
end
