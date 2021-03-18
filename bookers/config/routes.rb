Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'books' => 'books#index', as: 'index_book'
  post 'books' => 'books#create'

  # .../books/1 や .../books/3 に該当する
  get 'books/:id' => 'books#show'
  get 'books/edit' => 'books#edit'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'book/:id' => 'books#update', as: 'update_book'

  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

end
