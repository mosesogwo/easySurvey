class ResponsesController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @response = @question.responses.build
  end

  def create
    # byebug
    question = Question.find(params[:question_id])
    @response = question.responses.build(response_params)
    if @response.save
      flash[:notice] = 'Response saved, click next to continue'
      redirect_to new_question_response_path(question)
    else
      flash.now[:alert] = 'Please make a valid choice'
      render :new
    end
  end

  private

  def response_params
    params.require(:response).permit(:response_text, :question_id)
  end
end
