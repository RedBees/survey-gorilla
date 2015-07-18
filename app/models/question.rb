class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  accepts_nested_attributes_for :choices, reject_if: lambda {|attributes| attributes['body'].blank?}
end
