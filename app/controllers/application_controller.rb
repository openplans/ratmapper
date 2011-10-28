class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def geo_json_for(stops)
    {
      :type => "FeatureCollection",
      :features => stops.map(&:as_geo_json)
    }
  end
  
end
