class CleanSearch
  attr_reader :address,
              :city,
              :state,
              :zip,
              :country,
              :to_search

  def initialize(params)
    @address = params[:address]
    @city = params[:city]
    @state = params[:state]
    @zip = params[:zip_code]
    @country = params[:country]
    @to_search = [@address, @city, @state, @zip, @country]
  end

  def location_results
    @to_search.delete('')
    sanitized = @to_search.join(', ')
    Geocoder.search(sanitized).map { |result| Location.new(result) }
  end
end
