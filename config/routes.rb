Rails.application.routes.draw do
  get     'admin'   =>  'sessions#new'
  post    'admin'   =>  'sessions#create'
  delete  'logout'  =>  'sessions#destroy'

  resources :vessels, except: :show

  namespace :admin do
    resources :vessels, except: :show
  end

  root to: 'vessels#index'
end
