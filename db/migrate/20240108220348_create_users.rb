class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :profile_image
      t.integer :phone_number
      t.string :password_digest
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
