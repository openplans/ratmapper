class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :stop_id
      t.string :name
      t.decimal :lat
      t.decimal :lon
      t.boolean :station
      t.string :parent_station

      t.timestamps
    end
  end
end
