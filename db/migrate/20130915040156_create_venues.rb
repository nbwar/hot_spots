class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :fsq_id
      t.integer :fsq_category_id
      t.integer :fsq_neighborhood_id
      t.float   :highest_count

      t.timestamps
    end
  end
end
