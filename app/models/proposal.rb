class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  has_many :approvals

end
