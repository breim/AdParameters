# frozen_string_literal: true

require 'rack/test'

RSpec.describe 'PlacementSearch API', type: :request do
  include Rack::Test::Methods

  def app
    App
  end

  describe 'GET /search' do
    context 'when there is a creative with price greater than search price' do
      before do
        get '/search', { price: 10.0 }
      end

      it 'returns the cheapest creative that meets the search criteria' do
        expect(last_response).to be_ok
        expect(JSON.parse(last_response.body)).to include('price' => be > 10.0)
      end
    end

    context 'when there are no creatives with price greater than search price' do
      before do
        get '/search', { price: 100.0 }
      end

      it 'returns a message indicating no creative meets the search criteria' do
        expect(last_response).to be_ok
        expect(JSON.parse(last_response.body)).to eq({ 'message' => 'There is no price lower than the entry value.' })
      end
    end
  end
end
