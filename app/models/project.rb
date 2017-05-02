class Project < ApplicationRecord
  self.primary_key = :id
  include QuickbooksQueryable
end
