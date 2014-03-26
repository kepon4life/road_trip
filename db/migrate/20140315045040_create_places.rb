class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :website
      t.float :lat
      t.float :lon
      t.integer :rating
      t.date :start_date
      t.date :end_date
      t.string :album_flickr_nb
      t.text :comments
      t.integer :parent_place_id
      t.integer :place_type_id
    end
  end
end
