require_relative "lib/issue_add_in_project_count.rb"
require_relative "lib/hook_issue_heading_patch.rb"

Redmine::Plugin.register :issue_counter do
  name 'Issue Counter plugin'
  author 'EdgarK'
  description 'This is a plugin for Redmine that should add issue counter related to the project.'
  version '0.0.1'
  url 'http://nopage'
  author_url 'http://nopage'
end
