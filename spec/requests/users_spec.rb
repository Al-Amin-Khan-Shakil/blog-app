require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "works! when for the index page" do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end
end
