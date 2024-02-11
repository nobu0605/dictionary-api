# typed: true

class Api::VocabularyBooksController < ApplicationController
  before_action :authenticate_api_user!
  extend T::Sig

  def create
    vocabulary_book = VocabularyBook.create!(vocabulary_book_params)
    return render status: 200, json: { status: 200, message: "Success", vocabulary_book: vocabulary_book }
  rescue Exception => e
    logger.error "An error occurred: #{e.message}"
    render status: "500", json: { message: "Internal Server Error" }
  end

  def list
    vocabulary_books = VocabularyBook.where(user_id: params[:user_id])
    return render status: 200, json: { status: 200, message: "Success", vocabulary_books: vocabulary_books }
  rescue Exception => e
    logger.error "An error occurred: #{e.message}"
    render status: "500", json: { message: "Internal Server Error" }
  end

  def delete
    VocabularyBook.destroy(params[:vocabulary_book_id])
    return render status: 200, json: { status: 200, message: "Success" }
  rescue Exception => e
    logger.error "An error occurred: #{e.message}"
    render status: "500", json: { message: "Internal Server Error" }
  end

  private
  def vocabulary_book_params
    params.require(:vocabulary_book).permit(:name, :user_id, :description)
  end
end
