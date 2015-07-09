class AddTimestamp < ActiveRecord::Migration
  def change
    add_column :images, :created_at, :datetime
  end
end
