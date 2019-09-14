require 'rails_helper'

RSpec.describe User, type: :model do

  it "is invalid without @" do
    user = User.new(email: "example", password: "example")
    expect(user).to be_invalid
  end

end
