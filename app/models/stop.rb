class Stop < ActiveRecord::Base

  scope :station, where(:station => true)
  
  has_many :incidents
  
  def as_geo_json
    {
      :type => "Feature", 
      :geometry => {
        :type => "Point", 
        :coordinates => [lon, lat]
      },
      :properties => {
        :id             => id,
        :name           => name,
        :incident_count => incidents.count,
        :popupContent   => name
      }
    }
  end
end
