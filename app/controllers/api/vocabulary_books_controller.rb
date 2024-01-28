# typed: true

class Api::VocabularyBooksController < ApplicationController
  before_action :authenticate_api_user!
  extend T::Sig

  def create
    vocabularyBook = VocabularyBook.create!(vocabulary_book_params)
    return render status: 200, json: { status: 200, message: "Success", vocabulary_book: vocabularyBook }
  rescue Exception => e
    render status: "500", json: { message: "Internal Server Error" }
  end

  def list
    vocabularyBook = VocabularyBook.where(user_id: params[:user_id])
    return render status: 200, json: { status: 200, message: "Success", vocabulary_book: vocabularyBook }
  rescue Exception => e
    render status: "500", json: { message: "Internal Server Error" }
  end

  def delete
    VocabularyBook.destroy(params[:vocabulary_book_id])
    return render status: 200, json: { status: 200, message: "Success" }
  rescue Exception => e
    render status: "500", json: { message: "Internal Server Error" }
  end

  private
  def vocabulary_book_params
    params.require(:vocabulary_book).permit(:name, :user_id, :description)
  end
end
