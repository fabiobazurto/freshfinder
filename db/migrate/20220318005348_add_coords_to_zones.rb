class AddCoordsToZones < ActiveRecord::Migration[6.1]
  def change
#    add_column :zones, :coords, :float, array: true, default: []
    add_column :zones,:coords, :geometry
    add_index  :zones, :coords, using: :gist
  end
end
