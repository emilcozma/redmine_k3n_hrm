module RedmineHrmK3n
  module Patches
    module AdditionalsHelpersPatch
	  include Redmine::I18n
	  def self.included(base) # :nodoc:
        base.class_eval do
          unloadable
		  def auto_complete_select_entries(name, type, option_tags, options = {})
			  unless option_tags.is_a?(String) || option_tags.blank?
				# if option_tags is not an array, it should be an object
				option_tags = options_for_select([[option_tags.try(:name), option_tags.try(:id)]], option_tags.try(:id))
			  end
			  s = []
			  s << hidden_field_tag("#{name}[]", '') if options[:multiple]
			  s << select_tag(name,
							  option_tags,
							  include_blank: options[:include_blank],
							  multiple: options[:multiple],
							  data: {placeholder: l(:label_project_select_placeholder)},
							  disabled: options[:disabled], class: "#{type}-relation")
			  s << render(layout: false,
						  partial: 'additionals/select2_ajax_call.js',
						  formats: [:js],
						  locals: { field_id: sanitize_to_id(name),
									ajax_url: send("auto_complete_#{type}_path", project_id: @project, user_id: options[:user_id]),
									options: options })
			  safe_join(s)
		  end
        end
      end
    end
  end
end

unless Additionals::Helpers.included_modules.include?(RedmineHrmK3n::Patches::AdditionalsHelpersPatch)
  Additionals::Helpers.send(:include, RedmineHrmK3n::Patches::AdditionalsHelpersPatch)
end