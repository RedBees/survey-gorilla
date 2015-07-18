class SurveyTakersController < ApplicationController

  def take
    @generated_survey = SurveyTaker.find_by(id: params[:id])
  end

  def thank_you
    @generated_survey = SurveyTaker.find_by(id: params[:id])
  end

  def taken
    params[:choices].values.each do |choice_id|
      Selection.create(choice_id: choice_id, taker_id: session[:user_id])
    end
    survey_taken = SurveyTaker.find_by(id: params[:survey_taken_id])
    redirect_to thank_you_path(survey_taken)
  end
end