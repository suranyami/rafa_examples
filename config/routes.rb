ActionController::Routing::Routes.draw do |map|
  map.resources :people, :collection => {:sample => :post}
  map.root :controller => "people"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
