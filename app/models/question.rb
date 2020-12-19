class Question < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true,length: {maximum: 500}
end
