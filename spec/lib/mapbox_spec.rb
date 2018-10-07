describe Mapbox do
  describe '#geocoding_search' do
    let(:query) { 'coffee' }
    let(:latitude) { '38.75' }
    let(:longitude) { '-9.14' }

    describe 'when status 200' do
      subject do
        VCR.use_cassette('Mapbox/geocoding_search/200') do
          described_class.geocoding_search(
            query: query,
            latitude: latitude,
            longitude: longitude
          )
        end
      end

      it 'returns a Hash' do
        expect(subject).to be_a(Hash)
      end
    end

    describe 'when error statuses' do
      subject do
        VCR.use_cassette('Mapbox/geocoding_search/400') do
          described_class.geocoding_search(
            query: query,
            latitude: latitude,
            longitude: longitude
          )
        end
      end
      let(:longitude) { '--9.14' }

      it 'raise an exception' do
        expect { subject }.to raise_exception(
          RuntimeError,
          /Mapbox unexpected HTTP status: \d{3}. Body:/
        )
      end
    end
  end
end
