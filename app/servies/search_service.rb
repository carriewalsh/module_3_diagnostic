class SearchService

  def initialize(zip)
    @zip = zip
  end

  def conn
    Faraday.new("https://developer.nrel.gov//api/alt-fuel-stations/v1/nearest.json") do |f|
      f.params["api_key"] = ENV["DEV_API_KEY"]
      f.params["access"] = "public"
      f.params["fuel_type"] = "ELEC,LPG"
      f.params["location"] = @zip
      f.params["radius"] = 5.0
      f.adapter Faraday.default_adapter
    end
  end


  def get_stations
    get_json[:fuel_stations]
  end

  def total_count
    get_json[:total_results]
  end

  private
    def get_json
      response = conn.get
      @_json ||= JSON.parse(response.body, symbolize_names: true)
    end


end
