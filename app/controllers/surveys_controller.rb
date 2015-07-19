class SurveysController < ApplicationController

  def index
    @surveys = Survey.all
  end

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

  def edit
    @survey = Survey.find_by(id: params[:id])
  end

  def update
    survey = Survey.find_by(id: params[:id])
    if survey.update(survey_params)
      redirect_to survey, notice: 'Survey successfully updated.'
    else
      redirect_to edit_survey_path(survey)
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :completion_message, questions_attributes: [:id, :body, :_destroy, choices_attributes: [:id, :body,:_destroy]] )
  end
end
