class Selection < ActiveRecord::Base
  belongs_to :choice
  belongs_to :user, foreign_key: 'taker_id'
end
