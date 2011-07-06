require_dependency 'application_controller'
require 'radiant-dashboard-extension'

class DashboardExtension < Radiant::Extension
  version RadiantDashboardExtension::VERSION
  description RadiantDashboardExtension::DESCRIPTION
  url RadiantDashboardExtension::URL
  
  def activate
    Page.send :include, Radiant::Dashboard::Page
    Admin::WelcomeController.send :include, Radiant::Dashboard::WelcomeController
    UserActionObserver.instance.send :add_observer!, DashboardLink
    
    unless defined? admin.dashboard
      Radiant::AdminUI.send :include, Radiant::Dashboard::AdminUI
      Radiant::AdminUI.load_dashboard_extension_regions
    end

    tab('Content') do
      add_item "☆", "/admin/dashboard", :before => "Pages"
    end
  end
    
end