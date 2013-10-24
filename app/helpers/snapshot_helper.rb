module SnapshotHelper

  def sufficient_snapshots_in_database(time_period)
     venues_snapshot_count >= time_period
  end

  def first_time_calculating_field(time_period)
    venues_snapshot_count == time_period
  end

  def venues_snapshot_count
    Snapshot.where("venue_id = #{self.venue_id}").count
  end

  def venue_snapshots_ordered_by_create
    Snapshot.where("venue_id = #{self.venue_id}").order('created_at DESC')
  end

  def smoothing_constant(n)
    2.0 / (n + 1)
  end

  def caluculate_ema(time_period, field)
    venue_snapshots_ordered_by_create.limit(time_period).pluck(field).inject(:+) / time_period
  end

  def text_conditions_met
    return false if self.histogram == nil
    self.histogram > 1 && no_recent_texts
  end

  def no_recent_texts
    venues = venue_snapshots_ordered_by_create.limit(15).to_a
    venues.select! { |venue| venue.histogram > 1 }
    venues.size == 0
  end
end