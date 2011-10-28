require 'csv'

CSV.foreach(File.join(Rails.root,'db','seeds','stops.txt'),headers: true) do |r|
  Stop.create :stop_id => r['stop_id'], :name => r['stop_name'], :lat => r['stop_lat'], :lon => r['stop_lon'], :station => r['location_type'], :parent_station => r['parent_station']
end