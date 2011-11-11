class IncidentsController < ApplicationController
  
  before_filter :load_stop_for_incident
  
  def show
    @incident = Incident.find params[:id]
  end
  
  def new
    @incident = @stop.incidents.build
  end
  
  def create
    if params[:incident][:kind].present? && params[:incident][:kind].length > 0
      params[:incident][:kind].each do |kind|
        Incident.create params[:incident].merge(:stop_id => @stop.id, :kind => kind)
      end
      respond_to do |format|
        format.html { redirect_to stop_path(@stop) }
        format.json { 
          render :json => { 
            :view => render_to_string(:partial => "stops/popup.html", :locals => { :stop => @stop, :incidents => @stop.incidents }) 
          }
        } 
      end
    else
      @incident = @stop.incidents.build params[:incident]
      
      respond_to do |format|
        flash[:alert] = "Hey, was it a rat or garbage?" 
        format.html { render :action => :new }
      end
    end
  end
  
  private
  
  def load_stop_for_incident
    @stop = Stop.find params[:stop_id]
  end
  
end
