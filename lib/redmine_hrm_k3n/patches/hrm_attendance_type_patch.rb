module RedmineHrmK3n
  module Patches
	module HrmAttendanceTypePatch
	  def self.included(base) # :nodoc:
        base.class_eval do
          unloadable
		  #safe_attributes 'totalable'
        end
      end
    end
  end
end

unless HrmAttendanceType.included_modules.include?(RedmineHrmK3n::Patches::HrmAttendanceTypePatch)
  HrmAttendanceType.send(:include, RedmineHrmK3n::Patches::HrmAttendanceTypePatch)
end