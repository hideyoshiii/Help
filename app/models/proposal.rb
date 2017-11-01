class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  has_many :approvals

  validates :user_id, presence: true
  validates :listing_id, presence: true
  validates :proposal_content, presence: true
  validates :proposal_price, presence: true

end
