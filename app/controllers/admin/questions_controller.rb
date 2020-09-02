class Admin::QuestionsController < AdminController
  def index
  end

  def new
    @question = Question.new
  end

  def create
    # byebug
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.build(question_params)
    byebug
    if @question.save
      flash[:notice] = 'Question added'
      redirect_to admin_survey_path(@question.survey)
    else
      flash.now[:notice] = "Question wasn't added. Please try again"
      render :new
    end
  end

  def destroy
  end

  private
  
  def question_params
    params.require(:question).permit(:question_text, :question_type, :required, :survey_id)
  end
end
