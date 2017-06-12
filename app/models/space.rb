class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :rate, Integer
  property :max_capacity, Integer

  def initialize(name, description, rate, max_capacity)
    @name = name
    @description = description
    @rate = rate
    @max_capacity = max_capacity
  end

end
