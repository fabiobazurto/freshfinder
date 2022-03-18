class CreateZones < ActiveRecord::Migration[6.1]
  def change
    create_table :zones do |t|
      t.string :name
      #t.st_point :polygon,  limit: {:srid=>3857, :type=>"polygon"}# geographic: true
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.string :state, null: false

      t.timestamps

      #t.index :polygon, using: :gist
      t.index %i[latitude longitude]
    end
  end
end
