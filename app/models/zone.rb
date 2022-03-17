class Zone < ApplicationRecord
  geocoded_by :full_address
#  reverse_geocoded_by :latitude, :longitude , address: :full_address  

  after_validation :geocode, :if => lambda{ |obj| obj.full_address_changed? }
 # after_validation :reverse_geocode 

end
