class DestinationDate
  attr_reader :date,
              :maxtempf,
              :maxtempc,
              :mintempf,
              :mintempc,
              :sunrise,
              :sunset,
              :hourly_breakdown,
              :name

  def initialize(marine_weather, name)
    @name = name
    @date = Date.parse(marine_weather[:date]).strftime('%A, %B %d')
    @maxtempf = marine_weather[:maxtempF]
    @maxtempc = marine_weather[:maxtempC]
    @mintempf = marine_weather[:mintempF]
    @mintempc = marine_weather[:mintempC]
    @sunrise = marine_weather[:astronomy].first[:sunrise]
    @sunset = marine_weather[:astronomy].first[:sunset]
    @hourly_breakdown = get_times(marine_weather[:hourly])
  end

  def get_times(day_times)
    day_times.map do |time|
      DestinationTime.new(time)
    end
  end
end
