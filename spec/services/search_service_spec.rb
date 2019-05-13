require "rails_helper"

describe SearchService do
  it "gets results" do
    service = SearchService.new(zip)
    results = service.get_results
    expect(results).to be_an(Array)
    expect(results).to have_key(:distance)
  end
end
