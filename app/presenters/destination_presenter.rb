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
    successful_search = @service.retrieve_marine_weather
    if successful_search
      return DestinationDate.new(successful_search, location_name)
    else
      return nil
    end
  end
end
