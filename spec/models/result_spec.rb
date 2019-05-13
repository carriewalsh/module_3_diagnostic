require "rails_helper"

describe Result, type: :model do
  it "can return combined address" do
    attributes = {
      street_address: "123 Fake St",
      city: "Springfields",
      state: "OR",
      zip: 97345
    }
    result = Result.new(attributes)

    address = "#{street_address} #{city}, #{state} #{zip}"

    expect(result.address).to eq(address)
  end
end
