class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  validates :title,presence:true
  validates :body,presence:true,length:{in: 1..200}
end