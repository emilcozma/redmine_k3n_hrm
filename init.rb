require 'redmine'

Redmine::Plugin.register :redmine_hrm_k3n do
  name 'keeen extend [Redmine HRM - redmine_hrm] plugin'
  author 'Emil COZMA'
  description "This plugin add some extra fields to redmine HRM plugin and extend it."
  version '1.0.0'
  author_url 'https://www.cozma.es' 

  begin
    requires_redmine_plugin :redmine_hrm, :version_or_higher => '1.3.3'
  rescue Redmine::PluginNotFound  => e
    raise "Please install redmine_hrm plugin"
  end
end

Rails.application.paths["app/overrides"] ||= []
Rails.application.paths["app/overrides"] << File.expand_path("../app/overrides", __FILE__)

if Redmine::Plugin.installed?('redmine_hrm')
  ActiveSupport::Reloader.to_prepare do
    require "redmine_hrm_k3n"
  end
end