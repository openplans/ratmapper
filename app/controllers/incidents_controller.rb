class IncidentsController < ApplicationController
  
  before_filter :load_stop_for_incident
  
  def show
    @incident = Incident.find params[:id]
  end
  
  def new
    @incident = @stop.incidents.build
  end
  
  def create
    @incident = Incident.new params[:incident].merge(:stop_id => @stop.id)
    
    if @incident.save
      respond_to do |format|
        format.html { redirect_to stop_incident_path(@stop, @incident) }
      end
    else
      respond_to do |format|
        flash[:alert] = "Something's missing from your incident report." 
        format.html { render :action => :new }
      end
    end
  end
  
  private
  
  def load_stop_for_incident
    @stop = Stop.find params[:stop_id]
  end
  
end
