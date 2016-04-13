class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :place_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :image

      t.timestamps null: false
    end
  end
end
