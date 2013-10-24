class AddAttributesToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :checkin_count, :float
    add_column :venues, :histogram, :float
  end
end
