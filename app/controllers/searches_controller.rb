class SearchesController < ApplicationController
  def index
  end

  def new
    render new_search_path
  end
end
