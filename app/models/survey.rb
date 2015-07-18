class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :questions
  accepts_nested_attributes_for :questions, reject_if: lambda {|attributes| attributes['body'].blank?}
end
