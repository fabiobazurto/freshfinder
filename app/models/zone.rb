class Zone < ApplicationRecord
  geocoded_by :full_address
#  reverse_geocoded_by :latitude, :longitude , address: :full_address  

  after_validation :geocode, :if => lambda{ |obj| obj.full_address_changed? }
 # after_validation :reverse_geocode 


  def self.search(address:)
    geo_result = Geocoder.search(address)
    self.g_within_polygon(geo_result.first.bounding_box) if geo_result.present?
  end
  
  def self.g_within_polygon(points)
    polygon = Geo.polygon(points)
    where('ST_Covers(:polygon, coords)', polygon: Geo.to_wkt(polygon))
  end  

  def self.g_near(point, distance)
  where(
    'ST_DWithin(coords, :point, :distance)',
    { point: Geo.to_wkt(point), distance: distance * 1000 } # wants meters not kms
  )
  end

  def self.g_within_box(sw_point, ne_point)
    where(
      "coords && ST_MakeEnvelope(:sw_lon, :sw_lat, :ne_lon, :ne_lat, #{
      Geo::SRID
    })",
      {
        sw_lon: sw_point.longitude,
        sw_lat: sw_point.latitude,
        ne_lon: ne_point.longitude,
        ne_lat: ne_point.latitude
      }
    )
  end  
  
end
