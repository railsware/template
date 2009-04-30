ActionController::Routing::Routes.draw do |map|
  map.resource :user_session
  
  map.resource :account, :controller => "users"  
  map.resources :users
  
  map.namespace :admin do |a|
    a.resources :users
    a.resource :user_session
  end
  
  map.root :controller => 'landing'
  
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
