class ProjectFullName < ActiveRecord::Base
  self.primary_key= :id
  belongs_to :project, optional: true
end