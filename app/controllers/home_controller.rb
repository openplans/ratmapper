class HomeController < ApplicationController
  
  def index
    respond_to do |format|
      format.html
      format.json do
        render :json => geo_json_for( Stop.station )
      end
    end
  end
end
