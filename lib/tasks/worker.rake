namespace :jobs do
  task :work => :environment do
    venues = Venue.all
    client = Foursquare2::Client.new(:client_id => ENV['CLIENT_ID'], :client_secret => ENV['CLIENT_SECRET']) 
    venues.each do |venue|
      Snapshot.create(checkin_count: client.herenow(venue.fsq_id).hereNow[:count], venue: venue)
    end
  end  
end