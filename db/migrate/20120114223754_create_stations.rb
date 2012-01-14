class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.decimal :latitude, :longitude
      t.string :name
      t.timestamps
    end
  end
end
