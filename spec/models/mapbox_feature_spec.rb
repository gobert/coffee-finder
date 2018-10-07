describe MapboxFeature do
  let(:metadata) do
    mapbox_answer = VCR.use_cassette('MapboxFeature') do
      Mapbox.geocoding_search(
        query: 'coffee',
        latitude: '52',
        longitude: '13'
      )
    end
    mapbox_answer['features'][0]
  end

  subject { described_class.new(metadata) }

  it { expect(subject.name).to eq('Balzac Coffee') }
  it { expect(subject.postcode).to eq('14473') }
end
