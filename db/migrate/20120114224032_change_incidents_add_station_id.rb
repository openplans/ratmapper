class ChangeIncidentsAddStationId < ActiveRecord::Migration
  def up
    add_column :incidents, :station_id, :integer
    remove_column :incidents, :stop_id
  end

  def down
    add_column :incidents, :stop_id, :integer
    remove_column :incidents, :station_id
  end
end
