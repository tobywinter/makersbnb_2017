class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :rate, Integer
  property :max_capacity, Integer
  property :available_from_date, Date
  property :available_to_date, Date

  def is_available?(start_date, end_date)
    return true if (start_date >= available_from_date && end_date <= available_to_date)
  end

end
