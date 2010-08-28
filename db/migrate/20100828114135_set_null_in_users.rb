class SetNullInUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :login, :string, :null => true
    change_column :users, :email, :string, :null => true
    change_column :users, :crypted_password, :string, :null => true
    change_column :users, :password_salt, :string, :null => true
    change_column :users, :persistence_token, :string, :null => true
    change_column :users, :single_access_token, :string, :null => true
    change_column :users, :perishable_token, :string, :null => true
    change_column :users, :login_count, :integer, :null => true
    change_column :users, :failed_login_count, :integer, :null => true
  end

  def self.down
  end
end
