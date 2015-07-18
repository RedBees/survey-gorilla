class SurveyTaker < ActiveRecord::Base
  belongs_to :survey
  belongs_to :taker, class_name: "User", foreign_key: 'taker_id'
end
