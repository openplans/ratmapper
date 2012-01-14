class DropStops < ActiveRecord::Migration
  def up
    drop_table :stops
  end

  def down
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
