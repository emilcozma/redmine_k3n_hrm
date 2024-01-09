module RedmineHrmK3n
  module Patches
    module HrmAttendancePatch
	  def self.included(base) # :nodoc:
        base.class_eval do
          unloadable
        end
      end
    end
  end
end

unless HrmAttendance.included_modules.include?(RedmineHrmK3n::Patches::HrmAttendancePatch)
  HrmAttendance.send(:include, RedmineHrmK3n::Patches::HrmAttendancePatch)
end