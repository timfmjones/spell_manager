Rails.application.routes.draw do
  get 'books/view'
  get 'books/create'
  get 'books/delete'
  get 'books/edit'
  get 'books/index'
  get 'static_pages/home'
  root to: 'static_pages#home'
    
  get 'spell/view'
  get 'spell/show'
  get 'spell/add'
  get 'spell/edit'
  get 'spell/delete'
  get 'spell/index'
  get 'spell/_form'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :books
    resources :spells
end
