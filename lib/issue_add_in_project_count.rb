class IssueObserver < ActiveRecord::Observer
  def after_save(issue)
    if issue.in_project_count == 0 || Issue.where(:project_id => issue.project_id).map(&:in_project_count).include?(issue.in_project_count)
      issue.update_column(:in_project_count, Issue.where(:project_id => issue.project_id).sort_by(&:in_project_count).last.in_project_count + 1)
    end
  end
end