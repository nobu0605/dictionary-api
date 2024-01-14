# typed: true

class Api::SearchWordController < ApplicationController
  before_action :authenticate_api_user!
  require "net/http"
  extend T::Sig

  sig {void}
  def search_word
    begin
      headers = { "X-RapidAPI-Key" => Rails.application.credentials.words_api[:api_key] }

      word_url = T.let("#{WORDS_API_ENDPOINT}/words/#{params[:word]}", String)
      word_uri = URI.parse(word_url)
      word_res = Net::HTTP.get(word_uri,headers)
      word = JSON.parse(word_res)

      if word["success"] == false
        return render status: "404", json: { message: "Word not found" }
      end

      examples_url = T.let("#{WORDS_API_ENDPOINT}/words/#{params[:word]}/examples", String)
      examples_uri = URI.parse(examples_url)
      examples_res = Net::HTTP.get(examples_uri,headers)

      render status: "200", json: {
        word: JSON.parse(word_res),
        examples: JSON.parse(examples_res)
      }
    rescue => e
      render status: "500", json: { message: "Internal Server Error" }
    end
  end

end
