class VenuesController < ApplicationController

  def status
    p params
    twiml = Twilio::TwiML::Response.new do |r|
      r.Sms "Hey!"
    end
    render 'venues/status.xml.erb', :content_type => 'text/xml'
  end

end