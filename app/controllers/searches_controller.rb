class SearchesController < ApplicationController
  def index
  end

  def new
    render new_search_path
  end

  def create
    search = Search.create(search_params)
    clean_search = CleanSearch.new(search_params)
    @potential_locations = clean_search.location_results
    redirect_to search_path(search.id)
  end

  private
  def search_params
    params.permit(:address, :city, :state, :zip, :country)
  end
end
