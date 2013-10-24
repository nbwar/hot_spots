class CreateSnapshots < ActiveRecord::Migration
  def change
    create_table :snapshots do |t|
      t.float :checkin_count
      t.float :short_ema
      t.float :long_ema
      t.float :macd
      t.float :signal_line
      t.float :histogram

      t.timestamps
    end
  end
end
