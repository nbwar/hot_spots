class ChangeIntegersToStrings < ActiveRecord::Migration
  def change
    change_column :venues, :fsq_id,              :string 
    change_column :venues, :fsq_category_id,     :string
    change_column :venues, :fsq_neighborhood_id, :string
  end
end
