class DestinationsController < ApplicationController
  def index
    dest = DestinationPresenter.new(params[:lat], params[:lon])
    @local_weather = dest.destination_weather(params[:display])
  end
end
