class Review < ApplicationRecord
  belongs_to :approval
  belongs_to :user

  validates :rate, presence: true
  validates :description, presence: true
end
