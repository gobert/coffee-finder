# A presenter: display our models for our API
# It take as input 1 or more models
# Returns a Hash as output.
class FeaturesPresenter
  def initialize(features)
    @features = features
  end

  # Display the name of the list of features grouped by postcode
  def to_h
    features.group_by(&:postcode).map do |postcode, objects|
      Hash[
        postcode => objects.map do |object|
          {
            'name' => object.name
          }
        end
      ]
    end.reduce(:merge)
  end

  private

  attr_accessor :features
end
