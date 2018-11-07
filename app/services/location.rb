class Location
  attr_reader :display_name,
              :latitude,
              :longitude

  def initialize(search_result)
    @display_name = search_result.data['display_name']
    @latitude = search_result.data['lat']
    @longitude = search_result.data['lon']
  end
end
