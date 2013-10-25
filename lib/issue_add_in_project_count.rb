class IssueObserver < ActiveRecord::Observer
  def after_save(issue)
    if issue.in_project_count == 0
      issue.in_project_count = Issue.where(:project_id => issue.project_id).sort_by(&:in_project_count).last.in_project_count + 1
      issue.save
    end
  end
end