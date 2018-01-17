class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :title,   presence: true,
                      length: { maximum: 100}
  validates :content, presence: true
  belongs_to :user
end
