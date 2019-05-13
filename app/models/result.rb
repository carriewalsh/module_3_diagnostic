class Result
  attr_reader :street_address,
              :city,
              :state,
              :zip,
              :name,
              :fuel_type,
              :distance,
              :hours

  def initialize(data)
    @street_address = data[:street_address]
    @city = data[:city]
    @state = data[:state]
    @zip = data[:zip]
    @name = data[:station_name]
    @fuel_type = data[:fuel_type_code]
    @distance = data[:distance]
    @hours = data[:access_days_time]
  end

  def address
    "#{@street_address} #{@city}, #{@state} #{@zip}"
  end

end
