require "rails_helper"

describe SearchService do
  it "gets results" do
    zip = 80206
    service = SearchService.new(zip)
    results = service.get_stations
    expect(results).to be_an(Array)
    expect(results.first).to have_key(:distance)
  end
end
