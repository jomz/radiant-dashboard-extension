ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :dashboard_links
  end
  map.dashboard 'admin/dashboard/:action', :controller => 'admin/dashboard'
end