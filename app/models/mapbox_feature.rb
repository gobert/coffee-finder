# This represent a Feature in the Mapbox API
# Function does not returns nil. They use the null object pattern.
# It's initalized with all the metadata of a feature on the Mapbox API.
# It exposes only the attributes we will need in the application.
class MapboxFeature
  def initialize(metadata)
    @metadata = metadata
  end

  def name
    metadata['text'] || ''
  end

  def postcode
    postcode_context['text'] || ''
  end

  private

  attr_reader :metadata

  def postcode_context
    metadata['context'].find do |context|
      context['id'] =~ /postcode/
    end || {}
  end
end
