class Approval < ApplicationRecord
  belongs_to :user
  belongs_to :proposal

  has_many :reviews
end
