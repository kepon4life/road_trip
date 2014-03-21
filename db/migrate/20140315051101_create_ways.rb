class CreateWays < ActiveRecord::Migration
  def change
    create_table :ways do |t|
      t.date :start_date
      t.date :end_date
      t.text :images
      t.text :comments
      t.integer :distance
      t.text :coordinates
      t.integer :transportation_id
    end
  end
end
