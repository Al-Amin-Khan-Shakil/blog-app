require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { User.create(name: 'Name 1', postsCounter: 0) }

  describe 'GET /index' do
    it 'should be a successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'should render the index page of users' do
      get '/users'
      expect(response).to render_template('users/index')
    end

    it 'should include the placeholder' do
      get '/users'
      expect(CGI.unescapeHTML(response.body)).to include('<section class = "users-section">')
    end
  end

  describe 'GET / show' do
    it 'should be a successfull respose for specfic id' do
      get "/users/#{user.id}"
      expect(response).to be_successful
    end

    it 'should render the show page of users' do
      get "/users/#{user.id}"
      expect(response).to render_template('users/show')
    end

    it 'should include the placeholder' do
      get "/users/#{user.id}"
      expect(response.body).to include('<section class = "user-section">'.html_safe)
    end
  end
end
