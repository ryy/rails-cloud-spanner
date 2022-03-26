class User < ApplicationRecord
  self.table_name = "Users"

  validates :Name, presence: true, uniqueness: true
end
