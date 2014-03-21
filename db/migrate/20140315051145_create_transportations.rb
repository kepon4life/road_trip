class CreateTransportations < ActiveRecord::Migration
  def change
    create_table :transportations do |t|
      t.string :name
    end
  end
end
