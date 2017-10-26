class Listing < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :proposals

  def like_user(id)
    likes.find_by(user_id: id)
  end

  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validates :area, presence: true
  validates :format, presence: true
  validates :budget, presence: true
  validates :deadline, presence: true

end
