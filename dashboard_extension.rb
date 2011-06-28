require_dependency 'application_controller'
class DashboardExtension < Radiant::Extension
  version "1.4.0"
  description "Dashboard provides a way to view recent activity in Radiant and gives small extensions a place to grow."
  url "http://saturnflyer.com/"
  
  def activate
    Page.send :include, Radiant::Dashboard::Page
    Admin::WelcomeController.send :include, Radiant::Dashboard::WelcomeController
    
    unless defined? admin.dashboard
      Radiant::AdminUI.send :include, Radiant::Dashboard::AdminUI
      Radiant::AdminUI.load_dashboard_extension_regions
    end

    tab('Content') do
      add_item "☆", "/admin/dashboard", :before => "Pages"
    end
  end
    
end