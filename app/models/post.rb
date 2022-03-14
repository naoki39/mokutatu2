class Post < ApplicationRecord
  validates :text, presence: true

  belongs_to :community
  belongs_to :user
  has_many :comments, dependent: :destroy
end
