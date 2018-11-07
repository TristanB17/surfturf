class SearchesController < ApplicationController
  def index
  end

  def new
  end

  def create
    search = Search.create(search_params)
    redirect_to search_path(search.id)
  end

  def show
    search = Search.find_by(id: params[:id])
    clean_search = CleanSearch.new(search)
    if clean_search.location_results.empty?
      search.delete
      redirect_to new_search_path
      flash[:notice] = "Sorry, no locations found with those parameters; get shocked, duhd"
    else
      @potential_locations = clean_search.location_results
    end
  end

  private
  def search_params
    params.permit(:address, :city, :state, :zip, :country)
  end
end
