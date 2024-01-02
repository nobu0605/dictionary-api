require "net/http"

namespace :test_request_to_words_api do
  desc "Test request to words api"
  task :test do
    url = "https://wordsapiv1.p.rapidapi.com/words/hatchback/typeOf"
    uri = URI.parse(url)
    headers = { "X-RapidAPI-Key" => Rails.application.credentials.words_api[:api_key] }
    response = Net::HTTP.get(uri,headers)
    p JSON.parse(response)
  end
end