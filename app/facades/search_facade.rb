class SearchFacade
  attr_reader :zip
  def initialize(zip)
    @zip = zip
  end

  def total_count
    service.total_count
  end


  def results
    stations_data.map do |data|
      Result.new(data)
    end
  end

  def service
    SearchService.new(@zip)
  end

  def stations_data
    @_stations_data ||= service.get_stations
  end


end
