module Radiant::Dashboard::WelcomeController
  def self.included(base)
    base.class_eval {
      before_filter :go_to_dashboard, :only => [:index]
      def go_to_dashboard
        redirect_to dashboard_path
      end
    }
  end
end
