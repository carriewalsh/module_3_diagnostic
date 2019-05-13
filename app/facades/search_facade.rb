class SearchFacade
  attr_reader :zip
  def initialize(zip)
    @zip = zip
  end

  def total_count
    results.total_count
  end

  def results
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1.json?") do |f|
      f.params["api_key"] = ENV["DEV_API_KEY"]
      f.params["access"] = "public"
      f.params["fuel_type"] = "ELEC,LPG"
      f.params["location"] = @zip
      f.params["radius"] = 5.0
      f.adapter Faraday.default_adapter
    end

    response = conn.get
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results].map do |result|
      Result.new(data)
    end
  end
end
