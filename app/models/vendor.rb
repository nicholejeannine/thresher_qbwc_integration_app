class Vendor < ApplicationRecord
  include QuickbooksQueryable
  self.primary_key = :id
end
