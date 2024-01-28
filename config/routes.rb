Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations'
    }
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"

    post "/get_user", to: "users#get_user"

    get "/search_word", to: "search_word#search_word"

    post "/vocabulary_books/create", to: "vocabulary_books#create"
    get "/vocabulary_books/list", to: "vocabulary_books#list"
    delete "/vocabulary_books/delete/:vocabulary_book_id", to: "vocabulary_books#delete"
  end
end
