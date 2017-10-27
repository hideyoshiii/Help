class Review < ApplicationRecord
  belongs_to :approval
  belongs_to :user
end
