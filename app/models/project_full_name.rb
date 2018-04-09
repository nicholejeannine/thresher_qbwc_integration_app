class ProjectFullName < ActiveRecord::Base
  self.primary_key= :id
  self.table_name = 'project_full_names'
  belongs_to :project, optional: true
end