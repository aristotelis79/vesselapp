Rails.application.routes.draw do
  get 'user/new'

  resources :vessels, except: :show

  namespace :admin do
    resources :vessels, except: :show
  end

  root to: 'vessels#index'
end
