class CreatePhoneNumbersVenues < ActiveRecord::Migration
  def change
    create_table :phone_numbers_venues do |t|
      t.references :phone_number
      t.references :venue
    end
  end
end
