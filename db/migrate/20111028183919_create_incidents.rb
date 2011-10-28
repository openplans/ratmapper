class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.integer :stop_id
      t.string :kind, :title
      t.text :description
      t.datetime :happened_at

      t.timestamps
    end
  end
end
