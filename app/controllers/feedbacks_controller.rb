class FeedbacksController < ApplicationController
  def new
    @feedback = if current_user.present?
      Feedback.new(name: current_user.full_name, email: current_user.email)
    else
      Feedback.new
    end
  end

  def create
    result = SendFeedback.call(feedback_params: feedback_params)

    if result.success?
      redirect_to root_path, notice: "Feedback was successfully send!"
    else
      @feedback = result.feedback
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end
end
