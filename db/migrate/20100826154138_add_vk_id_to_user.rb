class AddVkIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :vk_id, :integer, :limit => 8
  end

  def self.down
    remove_column :users, :vk_id
  end
end
