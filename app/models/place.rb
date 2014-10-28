class Place < ActiveRecord::Base
  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode  # auto-fetch address
  geocoded_by :address, :latitude  => :lat, :longitude => :lng   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
end
