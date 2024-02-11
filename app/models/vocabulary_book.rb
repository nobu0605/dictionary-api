# typed: true

class VocabularyBook < ApplicationRecord
  belongs_to :user
  has_many :vocabulary_words, dependent: :destroy

end
