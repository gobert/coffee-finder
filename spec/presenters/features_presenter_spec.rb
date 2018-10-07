describe FeaturesPresenter do
  let(:mapbox_answer) do
    VCR.use_cassette('FeaturesPresenter') do
      Mapbox.geocoding_search(
        query: 'coffee',
        latitude: '52',
        longitude: '13'
      )
    end
  end
  let(:feature0) { mapbox_answer['features'][0] }
  let(:feature1) { mapbox_answer['features'][1] }

  subject do
    described_class.new(
      [
        MapboxFeature.new(feature0),
        MapboxFeature.new(feature1)
      ]
    ).to_h
  end

  describe '#to_h' do
    it 'groups results by postcode' do
      expect(subject.keys.first).to eq('14473')
    end

    it 'displays shop name' do
      expect(subject.values.first).to eq(['name' => 'Balzac Coffee'])
    end
  end
end
