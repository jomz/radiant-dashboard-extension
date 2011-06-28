module Radiant::Dashboard::AdminUI

 def self.included(base)
   base.class_eval do

      attr_accessor :dashboard
      alias_method :dashboards, :dashboard

      def load_default_regions_with_dashboard
        load_default_regions_without_dashboard
        load_dashboard_extension_regions
      end
      alias_method_chain :load_default_regions, :dashboard

      def load_dashboard_extension_regions
        @dashboard = load_default_dashboard_regions
      end
      
      def add_to_dashboard(partial, region=:main, options={})
        dashboard.index.add region, partial, options
      end
      
    protected

      def load_default_dashboard_regions
        returning OpenStruct.new do |dashboard|
          dashboard.index = Radiant::AdminUI::RegionSet.new do |index|
            index.main.concat %w{draft_pages recent_pages recent_assets}
            index.margin.concat %w{user_info quicklinks}
            index.tasks.concat %w{user_tasks admin_tasks}
            index.node.concat %w{title_column status_column actions_column}
          end
        end
      end      
    end
  end
end

