class Post < ApplicationRecord
  validates :text, presence: true

  belongs_to :community
  belongs_to :user
end
