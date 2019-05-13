require "rails_helper"

describe "User can search by zip code" do
  it "returns a list of stations that match query" do
    visit "/"
    fill_in "zip", with: 80206
    click_on "Locate"

    expect(current_path).to eq('/search')

    expect(page).to have_content("Total Results: 93")
    expect(page).to have_css(".station", count: 15)
    expect(page).to_not have_content("")
    expect(page).to_not have_content("private")
    expect(page).to_not have_content("planned")
    expect(page).to_not have_content("temporary unavailable")

    within first ".station" do
      expect(page).to have_content("Name: ")
      expect(page).to have_content("Address: ")
      expect(page).to have_content("Fuel Types: ")
      expect(page).to have_content("Distance: ")
      expect(page).to have_content("Access Times: ")
    end


  end
end

# As a user
# When I visit "/"
# And I fill in the search form with 80206 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see the total results of the stations that match my query, 90.
# Then I should see a list of the 15 closest stations within 5 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And the stations should only be public, and not private, planned or temporarily unavailable.
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
