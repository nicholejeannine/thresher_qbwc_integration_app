class Client < ApplicationRecord
  self.primary_key = :id
  include QuickbooksQueryable
end
