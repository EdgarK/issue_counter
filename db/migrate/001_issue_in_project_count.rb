class IssueInProjectCount < ActiveRecord::Migration
  def self.up
    add_column :issues, :in_project_count, :integer, :default => 0, :null => false
    
    project_id = 0
    issue_id = 0
    Issue.all.sort_by(&:project_id).each do |issue| 
      if issue.project_id != project_id
        issue_id = 0
        project_id = issue.project_id
      end
      issue_id += 1
      issue.in_project_count = issue_id
      issue.save
    end
  end

  def self.down
    remove_column :issues, :in_project_count
  end
end
