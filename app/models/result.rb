class Result
  attr_reader :street_address, :city, :state, :zip

  def initialize(data)
    @street_address = data[:street_address]
    @city = data[:city]
    @state = data[:state]
    @zip = data[:zip]
  end

  def address
    "#{@street_address} #{@city}, #{@state} #{@zip}"
  end

end
