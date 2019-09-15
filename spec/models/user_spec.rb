require 'rails_helper'

RSpec.describe User, type: :model do

  it "return a name" do
    user = User.new(
      name: "example",
      email: "example",
      password: "example",
    )
    expect(user.name).to eq "example"
  end
end
