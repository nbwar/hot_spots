class VenueHighestCountHasDefaultValue < ActiveRecord::Migration
  def change
    change_column :venues, :highest_count, :float, :default => 0
  end
end
