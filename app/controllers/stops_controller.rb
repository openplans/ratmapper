class StopsController < ApplicationController

  def index
    @stops    = Stop.station
  end
  
  def show
    @stop      = Stop.find params[:id]
    @incidents = @stop.incidents
  end
end
