class VenueSerializer < ActiveModel::Serializer
  attributes :id, :checkin_count, :histogram, :name
end
