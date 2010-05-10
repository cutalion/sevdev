class ChangePlaceToPlaceId < ActiveRecord::Migration
  def self.up
    remove_column :events, :place
    add_column :events, :place_id, :integer
  end

  def self.down
    remove_column :events, :place_id
    add_column :events, :place, :string
  end
end
