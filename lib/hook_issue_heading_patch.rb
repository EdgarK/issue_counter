require_dependency 'issues_helper'
module HookIssueHeadingPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development

      alias_method_chain :issue_heading, :project_count
    end
  end

  module InstanceMethods
    # Adds an in project count to issue heading
    def issue_heading_with_project_count(issue)
      "#{issue_heading_without_project_count(issue)} in project ##{issue.in_project_count}"
    end
  end
end

IssuesHelper.send(:include, HookIssueHeadingPatch)