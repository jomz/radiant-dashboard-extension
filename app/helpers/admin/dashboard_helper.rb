module Admin::DashboardHelper
  include Admin::NodeHelper
  include Admin::PagesHelper
  
  def updater_name_for(obj, options={})
    associations = *options[:associations] || [:updated_by, :created_by]
    attribute = options[:attribute] || :name
    not_found = options[:not_found] || 'Radiant System'
    answer = ""
    for association in associations
      if obj.respond_to?(association.to_sym)
        if obj.send(association.to_sym).nil?
          answer = not_found
        else
          answer = obj.send(association.to_sym).send(attribute.to_sym)
          break
        end
      end
    end
    answer
  end
  
  def page_list(pages)
    rows = pages.collect { |page| render_dashboard_node(page, :level => 0) }
    content_tag(:div, rows, :class => "pages")
  end

  def page_list_if_any(pages)
    if pages.any?
      page_list(pages)
    else
      content_tag(:p, t('dashboard_extension.no_show'), :class => 'minor')
    end
  end

  def render_dashboard_node(page, locals = {})
    @current_node = page
    locals.merge!(:page => page)
    render :partial => 'admin/pages/dashboard_node', :locals =>  locals
  end
  
  def dashboard_link(dl)
    link_to dl.title, dl.path, :class => "shortcut dashboard_module #{dl.cssclass}"
  end
  
  def empty_dashboard_link
    if admin?
      link_to t('dashboard_extension.add_dashboard_link'), new_admin_dashboard_link_url, :class => "shortcut dashboard_module empty"
    else
      content_tag(:span, "&nbsp;", :class => 'shortcut dashboard_module empty')
    end
  end

end