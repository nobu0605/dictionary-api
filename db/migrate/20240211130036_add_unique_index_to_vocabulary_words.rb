class AddUniqueIndexToVocabularyWords < ActiveRecord::Migration[7.0]
  def change
    add_index :vocabulary_words, %i[vocabulary_book_id word], unique: true
  end
end
