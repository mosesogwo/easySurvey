class Admin::SurveysController < AdminController
  def index
    @surveys = current_admin.surveys
  end

  def new
    @survey = current_admin.surveys.build()
  end

  def create
    @survey = current_admin.surveys.build(survey_params)
    # byebug
    if @survey.save
      flash[:notice] = 'Survey successfully created'
      redirect_to admin_survey_path(@survey)
    else
      flash.now[:notice] = 'Something went wrong, please try again'
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      flash[:notice] = 'Survey successfully edited'
      redirect_to admin_surveys_path
    else
      flash.now[:notice] = 'Something went wrong, please try again'
      render :edit
    end
  end

  def destroy
  end
  

  private

  def survey_params
    params.require(:survey).permit(:title, :end_date)
  end
end
