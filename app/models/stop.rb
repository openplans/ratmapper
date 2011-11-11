class Stop < ActiveRecord::Base

  scope :station, where(:station => true)
  
  has_many :incidents, :order => "happened_at desc"
  
  def display_name
    "#{name} - #{line} Platform"
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
