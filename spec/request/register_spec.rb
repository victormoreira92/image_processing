require 'rails_helper'

RSpec.describe "Register", type: :request do
  describe "POST /register" do
    it "registers a new user", :aggregate_failures do
      user_params = {
        user: {
          email: "email@email.com",
          password: "password"
        }
      }
      post user_session_url, params: user_params
      expect(response).to have_http_status(:created)
      binding.pry
      json_response = JSON.parse(response.body)
      expect(json_response['email']).to eq("email@email.com")
    end
  end
end
