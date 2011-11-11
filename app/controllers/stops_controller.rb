class StopsController < ApplicationController

  def index
    @stops    = Stop.station
  end
  
  def show
    @stop      = Stop.find params[:id]
    @incidents = @stop.incidents
    
    respond_to do |format|
      format.html
      format.json {
        render :json => { 
          :view => render_to_string(:partial => "popup.html", :locals => { 
            :stop => @stop, :incidents => @incidents, :incident => @stop.incidents.build(:type => "rat") 
          }) 
        } 
      }
    end
  end
end
