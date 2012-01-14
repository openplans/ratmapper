class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name, :division, :line
      t.timestamps
    end
  end
end
