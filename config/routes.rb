Rails.application.routes.draw do
  get 'to_do_list/index'
  post 'to_do_list/load_sample_data'
  post 'to_do_list/update_priority'
  resources :to_do_lists do
    resources :tasks, only: [:index, :new, :create, :update, :destroy]
  end
end
