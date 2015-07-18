class User < ActiveRecord::Base
  has_secure_password
  has_many :surveys, foreign_key: 'creator_id'
  has_many :surveys, foreign_key: 'taker_id'
  has_many :selections
end
