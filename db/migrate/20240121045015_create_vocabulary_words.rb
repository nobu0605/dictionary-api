class CreateVocabularyWords < ActiveRecord::Migration[7.0]
  def change
    create_table :vocabulary_words do |t|
      t.string :word, null: false
      t.references :vocabulary_book
      t.string :definition, null: false
      t.string :pronunciation, null: false
      t.string :part_of_speech, null: false
      t.text :examples

      t.timestamps
    end
    add_foreign_key :vocabulary_words, :vocabulary_books, on_delete: :cascade
  end
end
