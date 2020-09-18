class ResponsesController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @response = @question.responses.build
  end

  def create
    # byebug
    question = Question.find(params[:question_id])
    next_question = Question.find_by(id: params[:question_id].to_i + 1) if Question.find_by(id: params[:question_id].to_i + 1)
    @response = question.responses.build(response_params)
    if @response.save
      flash[:notice] = 'Response saved, click next to continue'
      if next_question
        redirect_to new_question_response_path(next_question)
      else
        redirect_to root_path
      end
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
