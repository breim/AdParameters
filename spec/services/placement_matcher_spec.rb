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
        { id: 'plc-1', floor_price: 15, creatives: [] },
        { id: 'plc-2', floor_price: 5, creatives: [] }
      ]
    end

    before do
      described_class.new(creatives, placements).match
    end

    it 'filters creatives that meet the floor price for each placement' do
      expect(placements.find { |placement| placement[:id] == 'plc-1' }[:creatives]).to match_array([{ id: 2, price: 20 }])
      expect(placements.find { |placement| placement[:id] == 'plc-2' }[:creatives]).to match_array([{ id: 1, price: 10 }, { id: 2, price: 20 }, { id: 3, price: 5 }])
    end

    it 'assigns no creatives to placements where none meet the floor price' do
      placement_c = { id: 'plc-3', floor_price: 25, creatives: [] }
      described_class.new(creatives, [placement_c]).match

      expect(placement_c[:creatives]).to be_empty
    end

    context 'test private methods of match object' do
      let(:placement) { { id: 'plc-4', floor_price: 15 } }
      subject(:matcher) { described_class.new([], []) }

      it 'returns creatives that meet the floor price of the placement' do
        matcher = described_class.new(creatives, [placement])
        expected_creatives = [{ id: 2, price: 20 }]
        filtered_creatives = matcher.send(:filter_creatives_for_placement, placement)
        expect(filtered_creatives).to match_array(expected_creatives)
      end

      it '.creative_meets_floor_price? if creative prive is equal to or greather than' do
        expect(matcher.send(:creative_meets_floor_price?, { price: 15 }, placement)).to be true
        expect(matcher.send(:creative_meets_floor_price?, { price: 20 }, placement)).to be true
      end

      it '.creative_meets_floor_price? if the creative price is less than the floor price' do
        expect(matcher.send(:creative_meets_floor_price?, { price: 10 }, placement)).to be false
      end
    end
  end
end
