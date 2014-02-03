class City < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord

  geocoded_by :query
  after_validation :geocode
end
