class SearchFacade
  attr_reader :zip
  def initialize(zip)
    @zip = zip
  end

  def results
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1.json?") do |f|
      f.adapter Faraday.default_adapter
    end

  end
end
