class SurveyTakersController < ApplicationController

  def take
    @generated_survey = SurveyTaker.find_by(id: params[:id])
  end

  def create
    generated_survey = SurveyTaker.new(survey_id: params[:survey_id],taker_id: params[:taker_id])
    if generated_survey.save
      redirect_to take_survey_path(generated_survey)
    else
      redirect_to surveys, notice: "You have already taken this survey"
    end
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

  private
  def survey_taker_params
    params.require(:survey_taker).permit(:survey_id,:taker_id)
  end
end