class Admin::SurveysController < AdminController
  def index
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
  end

  def update
  end

  def destroy
  end
  

  private

  def survey_params
    params.require(:survey).permit(:title, :end_date)
  end
end
