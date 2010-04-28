class AddPlaceStartedAtVkIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :place, :string
    add_column :events, :started_at, :timestamp
    add_column :events, :vkontakte_event_id, :integer
  end

  def self.down
  end
end
