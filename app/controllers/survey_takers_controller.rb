class SurveyTakersController < ApplicationController

  def take
    @generated_survey = SurveyTaker.find_by(id: params[:id])
  end

  def thank_you
    @generated_survey = SurveyTaker.find_by(id: params[:id])
  end
end