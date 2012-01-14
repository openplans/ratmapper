# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120114231945) do

  create_table "incidents", :force => true do |t|
    t.string   "kind"
    t.string   "title"
    t.text     "description"
    t.datetime "happened_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "station_id"
  end

  create_table "routes", :force => true do |t|
    t.string   "name"
    t.string   "division"
    t.string   "line"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "station_routes", :force => true do |t|
    t.integer  "station_id"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "station_routes", ["route_id"], :name => "index_station_routes_on_route_id"
  add_index "station_routes", ["station_id"], :name => "index_station_routes_on_station_id"

  create_table "stations", :force => true do |t|
    t.decimal  "latitude",   :precision => 10, :scale => 0
    t.decimal  "longitude",  :precision => 10, :scale => 0
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
