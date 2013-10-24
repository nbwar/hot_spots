class AddVenueIdToSnapshots < ActiveRecord::Migration
  def change
    add_column :snapshots, :venue_id, :integer
  end
end
