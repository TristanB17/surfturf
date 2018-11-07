class DestinationService
  attr_reader :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def retrieve_marine_weather
    get_json("/premium/v1/marine.ashx?q=#{@coordinates}&key=#{ENV['MARINE_KEY']}&format=json&tp=1")
  end

  private
  def conn
    Faraday.new("https://api.worldweatheronline.com") do |faraday|
      faraday.adapter(Faraday.default_adapter)
    end
  end

  def get_json(url)
    begin
      JSON.parse(conn.get(url).body, symbolize_names: true)[:data][:weather].first
    rescue => error
      return nil
    end
  end
end
