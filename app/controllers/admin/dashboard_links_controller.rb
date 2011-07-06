class Admin::DashboardLinksController < Admin::ResourceController
  helper Admin::DashboardHelper

  only_allow_access_to :new, :create, :edit, :update, :remove, :destroy,
    :when => :admin,
    :denied_url => { :controller => 'dashboard', :action => 'index' },
    :denied_message => 'You must be an administrator to configure the dashboard.'
  
end
