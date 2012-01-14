class Station < ActiveRecord::Base
  validates :name, :presence => true
  validates :latitude, :presence => true
  validates :longitude, :presence => true
  
  has_many :incidents, :inverse_of => :station
  has_many :station_routes
  has_many :routes, :through => :station_routes
end
