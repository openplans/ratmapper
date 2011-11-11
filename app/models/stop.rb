class Stop < ActiveRecord::Base

  scope :station, where(:station => true)
  
  has_many :incidents
  
  def display_name
    "#{name} - #{line} Train"
  end
  
  def line
    "#{stop_id[0]}"
  end
  
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
        :incident_count => incidents.count
      }
    }
  end
end
