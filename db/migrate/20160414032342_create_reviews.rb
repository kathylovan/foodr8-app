class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true
      t.integer :food
      t.integer :drinks
      t.integer :service
      t.integer :atmosphere
      t.integer :parking
      t.integer :family
      t.integer :dog
      t.integer :gluten
      t.text :comments

      t.timestamps null: false
    end
  end
end
