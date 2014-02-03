require 'bundler/setup'
require 'geocoder'

class City < ActiveRecord::Base
  geocoded_by :query
  after_validation :geocode
end
