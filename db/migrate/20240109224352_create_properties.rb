class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :image
      t.text :description
      t.decimal :price
      t.string :bedrooms
      t.string :location
      t.boolean :is_approved

      t.timestamps
    end
  end
end
