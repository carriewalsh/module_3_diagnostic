require "rails_helper"

describe Result, type: :model do
  it "can return combined address" do
    attributes = {
      street_address: "123 Fake St",
      city: "Springfield",
      state: "OR",
      zip: 97345
    }
    result = Result.new(attributes)

    address = "#{attributes[:street_address]} #{attributes[:city]}, #{attributes[:state]} #{attributes[:zip]}"

    expect(result.address).to eq(address)
  end
end
