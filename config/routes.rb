Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'

    post "/get_user", to: "users#get_user"

    get "/search_word", to: "search_words#search_word"

    post "/vocabulary_books/create", to: "vocabulary_books#create"
    get "/vocabulary_books/list", to: "vocabulary_books#list"
    delete "/vocabulary_books/delete/:vocabulary_book_id", to: "vocabulary_books#delete"
  end
end
