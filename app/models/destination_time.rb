class DestinationTime
  attr_reader :time,
              :tempf,
              :tempc,
              :wind_speed_miles,
              :wind_speed_kmph,
              :wave_height_meters,
              :wave_height_feet,
              :water_temp_f,
              :water_temp_c

  def initialize(time_hash)
    @time = time_change[time_hash[:time]]
    @tempf = time_hash[:tempF]
    @tempc = time_hash[:tempC]
    @wind_speed_miles = time_hash[:windspeedMiles]
    @wind_speed_kmph = time_hash[:windspeedKmph]
    @wave_height_meters = time_hash[:sigHeight_m]
    @wave_height_feet = (time_hash[:sigHeight_m].to_i * 3.281).to_s
    @water_temp_f = time_hash[:waterTemp_F]
    @water_temp_c = time_hash[:waterTemp_C]
  end

  def time_change
    {
      '0' => '12:00am',
      '100' => '1:00am',
      '200' => '2:00am',
      '300' => '3:00am',
      '400' => '4:00am',
      '500' => '5:00am',
      '600' => '6:00am',
      '700' => '7:00am',
      '800' => '8:00am',
      '900' => '9:00am',
      '1000' => '10:00am',
      '1100' => '11:00am',
      '1200' => '12:00pm',
      '1300' => '1:00pm',
      '1400' => '2:00pm',
      '1500' => '3:00pm',
      '1600' => '4:00pm',
      '1700' => '5:00pm',
      '1800' => '6:00pm',
      '1900' => '7:00pm',
      '2000' => '8:00pm',
      '2100' => '9:00pm',
      '2200' => '10:00pm',
      '2300' => '11:00pm'
    }
  end
end
