Rails.application.routes.draw do

  get 'login' ,to: 'sessions#new'
  #get 'sessions/create'
  delete 'logout' ,to: 'sessions#delete'

  root 'staticpages#home'
  get 'help' ,to: 'staticpages#help'
  get 'about' ,to: 'staticpages#about'
  get 'contact' ,to: 'staticpages#contact'
  get 'news' ,to: 'staticpages#news'
  get 'signup' ,to: 'users#new'
  get 'follow_check' ,to: "relationships#check"
  
  resources :users
  resources :sessions
  resources :microposts
  resources :users do
    member do
     get :following, :followers
    end
  end
end