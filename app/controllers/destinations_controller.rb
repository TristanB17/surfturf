class DestinationsController < ApplicationController
  def index
    dest = DestinationPresenter.new(params[:lat], params[:lon])
    if dest.destination_weather(params[:display])
      @local_weather = dest.destination_weather(params[:display])
    else
      return nil
    end
  end
end
