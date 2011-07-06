module Radiant::Dashboard::AdminUI

 def self.included(base)
   base.class_eval do

      attr_accessor :dashboard, :dashboard_link
      alias_method :dashboards, :dashboard
      alias_method :dashboard_links, :dashboard_link

      def load_default_regions_with_dashboard
        load_default_regions_without_dashboard
        load_dashboard_extension_regions
      end
      alias_method_chain :load_default_regions, :dashboard

      def load_dashboard_extension_regions
        @dashboard = load_default_dashboard_regions
        @dashboard_link = load_default_dashboard_link_regions
      end
      
      def add_to_dashboard(partial, region=:main, options={})
        dashboard.index.add region, partial, options
      end
      
    protected

      def load_default_dashboard_regions
        OpenStruct.new.tap do |dashboard|
          dashboard.index = Radiant::AdminUI::RegionSet.new do |index|
            index.main.concat %w{shortcuts user_info recent_pages draft_pages user_tasks recent_assets}
            index.shortcuts.concat %w{}
            index.node.concat %w{title_column status_column actions_column}
          end
        end
      end      

      def load_default_dashboard_link_regions
        OpenStruct.new.tap do |dashboard_link|
          dashboard_link.edit = Radiant::AdminUI::RegionSet.new do |edit|
            edit.main.concat %w{edit_header edit_form}
            edit.form.concat %w{edit_title edit_path edit_cssclass}
            edit.form_bottom.concat %w{edit_buttons}
          end
          dashboard_link.index = Radiant::AdminUI::RegionSet.new do |index|
            index.thead.concat %w{title_header path_header action_header}
            index.tbody.concat %w{title_cell path_cell action_cell}
            index.bottom.concat %w{buttons}
          end
          dashboard_link.new = dashboard_link.edit
        end
      end      

    end
  end
end

