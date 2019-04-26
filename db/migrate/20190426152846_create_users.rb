class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.boolean :admin, :default => false
      t.datetime :created, :null => false
      t.datetime :updated, :null => false
      t.string :uid
      t.string :email
      t.string :provider
      t.string :name
      t.string :image


      t.timestamps
    end
  end
end
