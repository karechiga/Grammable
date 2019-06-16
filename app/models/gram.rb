class Gram < ApplicationRecord
  validates :message, presence: true, length: { minimum: 3 }

  belongs_to :user
end
