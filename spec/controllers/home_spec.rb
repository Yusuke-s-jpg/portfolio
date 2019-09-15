require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  it "get home" do
    get :index
    expect(response).to have_http_status "200"
  end
  
end
