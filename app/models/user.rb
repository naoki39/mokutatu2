class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, on: :create

  with_options presence: true do
      validates :nickname
      validates :goal
      validates :second_goal
      validates :to_do
      validates :image
  end
  
  has_one_attached :image
  belongs_to :community, optional: true
  has_many :posts, dependent: :destroy
end
