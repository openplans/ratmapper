class Route < ActiveRecord::Base
  validates :name, :presence => true
  
  has_many :station_routes
  has_many :stations, :through => :station_routes
end
