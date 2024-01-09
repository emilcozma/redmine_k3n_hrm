module RedmineHrmK3n
  module Patches
	module HrmAttendanceTypesControllerPatch
	  def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)
		base.class_eval do
          unloadable
		  alias_method :allowed_params, :allowed_params_with_totalable 
        end
      end
	  module InstanceMethods
		def allowed_params_with_totalable
		  params.require(:attendance_type).permit :name,
                                            :is_default,
                                            :color,
                                            :mail_to_superior,
                                            :at_work,
											:totalable,
                                            :input_format,
                                            :default_limit,
                                            :approval_required,
                                            :logging,
                                            :logging_project_id,
                                            :logging_activity_id,
                                            :ip_range,
                                            :ip_range_rule,
                                            :description,
                                            :position,
                                            watcher: []
		end
	  end
    end
  end
end

unless HrmAttendanceTypesController.included_modules.include?(RedmineHrmK3n::Patches::HrmAttendanceTypesControllerPatch)
  HrmAttendanceTypesController.send(:include, RedmineHrmK3n::Patches::HrmAttendanceTypesControllerPatch)
end