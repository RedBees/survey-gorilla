class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :taker, class_name: 'User', foreign_key: 'taker_id'
  has_many :questions
  accepts_nested_attributes_for :questions, reject_if: lambda {|attributes| attributes['body'].blank?}, allow_destroy: true

  def final_message
    self.completion_message ||= "Thank you for completing this survey."
  end
end
