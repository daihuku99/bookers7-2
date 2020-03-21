Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	registrations: 'users/registrations'
  }

  get 'book_images' => 'book_images#index', as: 'book_images'

  post 'book_images' => 'book_images#create'

  get 'book_images/:id' => 'book_images#show', as: 'book_image'

  get 'book_images/:id/edit' => 'book_images#edit', as: 'edit_book_image'

  patch 'book_images/:id' => 'book_images#update'

  delete 'book_images/:id' => 'book_images#destroy', as: 'destroy_book_image'

  get 'users' => 'users#index', as: 'users'

  get 'users/:id' => 'users#show', as: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
