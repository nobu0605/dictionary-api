# typed: true

class Api::VocabularyWordsController < ApplicationController
  before_action :authenticate_api_user!
  extend T::Sig

end
