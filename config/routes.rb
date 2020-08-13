Rails.application.routes.draw do
  get 'spells/index'
  get 'spells/create'
  get 'spells/new'
  get 'spells/edit'
  get 'spells/show'
  get 'spells/update'
 
  get 'spells/addToBook'
  
  get 'books/view'
  get 'books/create'
  get 'books/delete'
  get 'books/edit'
  get 'books/index'
  get 'static_pages/home'
  root to: 'static_pages#home'
   
   get 'spells/:id/addToBook', to: 'spells#addToBook', as: 'addToBook_spell' 
    
  get 'spells/:id/destroy', to: 'spells#destroy', as: 'delete_spell'

  get 'books/:id/destroy', to: 'books#destroy', as: 'delete_book'
    
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :books
    resources :spells
end
