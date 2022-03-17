class CreateZones < ActiveRecord::Migration[6.1]
  def change
    create_table :zones do |t|
      t.string :name
      t.st_point :coords, null: false, geographic: true
      t.float :longitude, null: false
      t.float :latitude, null: false

      t.timestamps

      t.index :coords, using: :gist
      t.index %i[latitude longitude]
    end
  end
end
