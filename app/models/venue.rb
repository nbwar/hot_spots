class Venue < ActiveRecord::Base
  has_many :snapshots
  has_and_belongs_to_many :phone_numbers

  validates_uniqueness_of :name

  def send_text
    self.phone_numbers.each do |pn|
      TWILIO.account.sms.messages.create(
        :from => "+14155087226",
        :to => "+1#{pn.phone_number}",
        :body => "get over to #{self.name}!  It's popping off!"
      )
    end
  end
end