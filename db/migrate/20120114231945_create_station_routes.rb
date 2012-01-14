class CreateStationRoutes < ActiveRecord::Migration
  def change
    create_table :station_routes do |t|
      t.integer :station_id, :route_id
      t.timestamps
    end
    
    add_index :station_routes, :station_id
    add_index :station_routes, :route_id
  end
end
