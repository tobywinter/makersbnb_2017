class AvailableDates
  include DataMapper::Resource

  property :id, Serial
  property :available_from_date, Date
  # property :available_to_date, Date
  property :space_id, Integer

end
