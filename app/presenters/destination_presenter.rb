class DestinationPresenter
  attr_reader :coordinates_formatted, :service

  def initialize(latitude, longitude)
    @coordinates_formatted = format_lat_lon(latitude, longitude)
    @service = DestinationService.new(@coordinates_formatted)
  end

  def format_lat_lon(latitude, longitude)
    [latitude,longitude].join(',')
  end

  def destination_weather(location_name)
    DestinationDate.new(@service.retrieve_marine_weather, location_name)
  end
end
