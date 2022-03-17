class AddFulladdressToZones < ActiveRecord::Migration[6.1]
  def change
    add_column :zones, :full_address, :string
  end
end
