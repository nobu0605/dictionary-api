class CreateVocabularyBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :vocabulary_books do |t|
      t.string :name, null: false
      t.references :user
      t.string :description

      t.timestamps
    end
    add_foreign_key :vocabulary_books, :users, on_delete: :cascade
  end
end
