
module RedmineHrmK3n
  module Hooks
    class ViewsLayoutsHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        return stylesheet_link_tag(:hrm, :plugin => 'redmine_hrm_k3n')
      end
    end
  end
end
