class Zone < ApplicationRecord
  geocoded_by :full_address
#  reverse_geocoded_by :latitude, :longitude , address: :full_address  

  after_validation :geocode, :if => lambda{ |obj| obj.full_address_changed? }
 # after_validation :reverse_geocode 


  def self.ready_to_delivery?(address:)
    self.search(address: address).present?
  end

  def self.search(address:)
    geo_result = Geocoder.search(address)
    if geo_result.present?
      self.g_within_polygon(geo_result.first)
    else
      puts "Maybe you need to be more specific. Try with other address!"
    end
  end
  
  def self.g_within_polygon(point)
    where("ST_WITHIN(st_geomfromtext('POINT(#{point.longitude} #{point.latitude})', 4326),coords)")
  end    
end
