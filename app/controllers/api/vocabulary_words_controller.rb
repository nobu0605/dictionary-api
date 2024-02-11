# typed: true

class Api::VocabularyWordsController < ApplicationController
  before_action :authenticate_api_user!
  extend T::Sig

  def show
    sql =
      'select
        vocabulary_books.name as vocabulary_book_name,
        vocabulary_words.*
      from vocabulary_books
      left join vocabulary_words on vocabulary_words.vocabulary_book_id = vocabulary_books.id
      where vocabulary_books.id = ?'
    vocabulary_words = VocabularyBook.find_by_sql([sql, params[:vocabulary_book_id]])

    return render status: 200, json: { status: 200, message: "Success", vocabulary_words: vocabulary_words }
  rescue Exception => e
    logger.error "An error occurred: #{e.message}"
    render status: "500", json: { message: "Internal Server Error" }
  end

  def create
    begin
      vocabulary_book = VocabularyWord.create!(vocabulary_word_params)
      return render status: 200, json: { status: 200, message: "Success", vocabulary_book: vocabulary_book }
    rescue ActiveRecord::RecordNotUnique => e
      logger.error "An error occurred: #{e.message}"
      render status: "422", json: { message: "This word has already been taken" }
    rescue Exception => e
      logger.error "An error occurred: #{e.message}"
      render status: "500", json: { message: "Internal Server Error" }
    end
  end

  def delete
    VocabularyWord.destroy(params[:vocabulary_word_id])
    return render status: 200, json: { status: 200, message: "Success" }
  rescue Exception => e
    logger.error "An error occurred: #{e.message}"
    render status: "500", json: { message: "Internal Server Error" }
  end

  private
  def vocabulary_word_params
    params.require(:vocabulary_word).permit(:part_of_speech,
      :pronunciation,
      :definition,
      :examples,
      :vocabulary_book_id,
      :word,)
  end
end
