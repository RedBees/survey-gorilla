class User < ActiveRecord::Base
  has_secure_password
  has_many :surveys, foreign_key: 'creator_id'
  has_many :surveys, foreign_key: 'taker_id'
  has_many :selections

  validates :username, :password, :first_name, :last_name, presence: true

  def created_surveys
    Survey.where(creator_id: self.id)
  end
end
