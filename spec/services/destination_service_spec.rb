require 'rails_helper'

describe DestinationService do
  context 'making an API call' do
    it 'returns correctly formatted data' do
      coordinates = "32.051544,-81.063702"
      VCR.use_cassette('huntington_beach') do
        service = DestinationService.new(coordinates)
        result = service.retrieve_marine_weather
        expect(result.keys).to include(:date)
        expect(result.keys).to include(:astronomy)
        expect(result.keys).to include(:hourly)
      end
    end
  end
end
