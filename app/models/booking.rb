class Booking
include DataMapper::Resource

# belongs_to :user
# belongs_to :space

property :id, Serial
# property :hired, Boolean, :default  => false
property :from_date, Date
property :to_date, Date

end
