class Api::SearchWordController < ApplicationController
  before_action :authenticate_api_user!
  require "net/http"

  def search_word
    url = "#{WORDS_API_ENDPOINT}/words/hatchback/typeOf"
    uri = URI.parse(url)
    headers = { "X-RapidAPI-Key" => Rails.application.credentials.words_api[:api_key] }
    response = Net::HTTP.get(uri,headers)
    JSON.parse(response)
    render json: response
  end

end
