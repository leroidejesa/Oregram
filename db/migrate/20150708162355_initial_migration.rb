class InitialMigration < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.boolean :admin
    end

    create_table :images do |t|
      t.integer :user_id
      t.string :description
    end

    create_table :comments do |t|
      t.integer :image_id
      t.string :text
      t.integer :user_id
    end
  end
end
