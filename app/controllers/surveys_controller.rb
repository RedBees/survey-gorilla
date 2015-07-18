class SurveysController < ApplicationController

  def show
    @survey = Survey.find_by(id: params[:id])
  end

  def new
    @survey = Survey.new
    question = @survey.questions.build
    4.times { question.choices.build }
  end

  def create
    survey = Survey.new(survey_params)
    survey.creator_id = session[:user_id]
    if survey.save
      redirect_to survey, notice: "Survey created successfully."
    else
      render new_survey_path
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :completion_message, questions_attributes: [:id, :body, choices_attributes: [:id, :body]] )
  end
end
