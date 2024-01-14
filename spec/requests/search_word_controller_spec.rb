require 'rails_helper'

RSpec.describe "SearchWordControllers", type: :request do
  include Warden::Test::Helpers

  describe "GET /search_word" do
    it 'search_word success' do
      user = { email: "john@example.com", password: "password" }

      auth_tokens = sign_in(user)
      get "/api/search_word", params: { word: "test" }, headers: auth_tokens

      expect(response.status).to eq 200
    end

    it 'search_word auth error wrong password' do
      user = { email: "john@example.com", password: "" }

      auth_tokens = sign_in(user)
      get "/api/search_word", params: { word: "test" }, headers: auth_tokens

      expect(response.status).to eq 401
    end

    it 'search_word 500 error idiom' do
      user = { email: "john@example.com", password: "password" }

      auth_tokens = sign_in(user)
      get "/api/search_word", params: { word: "in the long run" }, headers: auth_tokens

      expect(response.status).to eq 500
    end

    it 'search_word 404 error idiom' do
      user = { email: "john@example.com", password: "password" }

      auth_tokens = sign_in(user)
      get "/api/search_word", params: { word: "testtest" }, headers: auth_tokens

      expect(response.status).to eq 404
    end
  end
end
