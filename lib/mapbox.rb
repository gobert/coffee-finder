# Handle communication with Mapbox API
# Methods return a Hash that represents the body of Mapbox API (JSON)
# It raises expection if status of Mapbox API is unexpected
# cf: https://www.mapbox.com/api-documentation
module Mapbox
  class << self
    BASE_URL = 'https://api.mapbox.com'.freeze
    MAPBOX_TOKEN = ENV['MAPBOX_TOKEN']

    def geocoding_search(query:, longitude:, latitude:)
      geocoding_search_url = "/geocoding/v5/mapbox.places/#{CGI.escape(query)}.json"
      params = {
        access_token: MAPBOX_TOKEN,
        limit: 10,
        proximity: "#{longitude},#{latitude}"
      }

      response = client.get(geocoding_search_url, params)

      check_status_code(response)

      JSON.parse(response.body)
    end

    private

    def client
      @client ||= Faraday.new(BASE_URL)
    end

    def check_status_code(response)
      return if response.status < 400

      raise(
        "Mapbox unexpected HTTP status: #{response.status}. Body: #{response.body}"
      )
    end
  end
end
