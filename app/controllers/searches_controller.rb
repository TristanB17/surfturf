class SearchesController < ApplicationController
  def index
  end

  def new
    render new_search_path
  end

  def create
    search = Search.create(search_params)
    redirect_to search_path(search.id)
  end

  def show
    search = Search.find_by(id: params[:id])
    clean_search = CleanSearch.new(search)
    @potential_locations = clean_search.location_results
  end

  private
  def search_params
    params.permit(:address, :city, :state, :zip, :country)
  end
end
