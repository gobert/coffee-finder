module V1
  class SearchController < ApplicationController
    before_action :check_params

    def coffee_shop
      query = Mapbox.geocoding_search(
        query: 'cafe',
        longitude: params['longitude'],
        latitude: params['latitude']
      )

      features = query['features'].map do |feature|
        MapboxFeature.new(feature)
      end

      render(
        json: FeaturesPresenter.new(features).to_h
      )
    end

    private

    def check_params
      mandatory_params = %w[longitude latitude]

      missing_params = mandatory_params - params.keys
      if missing_params.present?
        body = { 'errors': ["Missing parameters #{missing_params}"] }
        render status: 400, json: body
      end
    end
  end
end
