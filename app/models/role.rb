class Role < ApplicationRecord
  belongs_to :user

  validates :name, inclusion: { in: [ "user", "admin" ], message: "%{:name} is not a valid role." }
end
