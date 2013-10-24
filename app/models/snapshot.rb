class Snapshot < ActiveRecord::Base
  include SnapshotHelper
  belongs_to :venue

  SIGNAL_LINE_PERIOD = 50
  SHORT_EMA_PERIOD = 75
  LONG_EMA_PERIOD = 150

  before_create :populate_algorithm_fields


  def populate_algorithm_fields
    venue_checkin_count
    calculate_short_ema if sufficient_snapshots_in_database(SHORT_EMA_PERIOD)
    calculate_long_ema if sufficient_snapshots_in_database(LONG_EMA_PERIOD)
    calculate_macd if sufficient_snapshots_in_database(LONG_EMA_PERIOD)
    if sufficient_snapshots_in_database( LONG_EMA_PERIOD + SIGNAL_LINE_PERIOD )
      calculate_signal_line
      calculate_histogram
    end
    @venue.send_text if text_conditions_met
  end

  def venue_checkin_count
    @venue = self.venue
    @venue.checkin_count = self.checkin_count
    @venue.highest_count = 0 if @venue.highest_count == nil
    @venue.highest_count = @venue.checkin_count if @venue.checkin_count > @venue.highest_count
    @venue.save
  end

  def calculate_short_ema
    if first_time_calculating_field(SHORT_EMA_PERIOD)
      self.short_ema = caluculate_ema(SHORT_EMA_PERIOD, 'checkin_count')
    else
      sc = smoothing_constant(SHORT_EMA_PERIOD)
      last_ema = venue_snapshots_ordered_by_create.first.short_ema
      self.short_ema = last_ema + sc * ( self.checkin_count - last_ema )
    end
  end

  def calculate_long_ema
    if first_time_calculating_field(LONG_EMA_PERIOD)
      self.long_ema = caluculate_ema(LONG_EMA_PERIOD, 'checkin_count')
    else
      sc = smoothing_constant(LONG_EMA_PERIOD)
      last_ema = venue_snapshots_ordered_by_create.first.long_ema
      self.long_ema = last_ema + sc * ( self.checkin_count - last_ema )
    end
  end

  def calculate_macd
    self.macd = self.short_ema - self.long_ema
  end

  def calculate_signal_line
    if first_time_calculating_field(LONG_EMA_PERIOD + SIGNAL_LINE_PERIOD)
      self.signal_line = caluculate_ema(SIGNAL_LINE_PERIOD, 'macd')
    else
      sc = smoothing_constant(SIGNAL_LINE_PERIOD)
      last_signal_line = venue_snapshots_ordered_by_create.first.signal_line
      self.signal_line = last_signal_line + sc * ( self.macd - last_signal_line )
    end
  end

  def calculate_histogram
    self.histogram = self.macd - self.signal_line
    @venue.histogram = self.histogram
    @venue.save
  end
end
