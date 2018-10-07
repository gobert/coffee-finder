require 'rails_helper'

describe 'Search', type: :request do
  let(:route) { '/v1/find/coffee_shops' }
  let(:http_params) { Hash['latitude' => 42, 'longitude' => 13] }

  context 'when good requests' do
    it 'returns 200' do
      VCR.use_cassette('SearchController/200') do
        get route, params: http_params
      end
      expect(response.status).to eq(200)
    end
  end

  %w[latitude longitude].each do |missing_param|
    context "when missing parameter #{missing_param}" do
      let(:http_params) { super().except(missing_param) }
      it 'answers 400' do
        get route, params: http_params
        expect(response.status).to eq(400)
      end

      it 'answer with missing latitutde' do
        get route, params: http_params
        expect(response.body).to match(/Missing.*#{missing_param}/)
      end
    end
  end
end
