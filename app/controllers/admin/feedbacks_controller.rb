module Admin
  class FeedbacksController < Admin::BaseController
    def index
      @feedbacks = AdminFeedbackQuery.new(Feedback.all).call(permitted_params)
    end

    def show
      @feedback = Feedback.find(params[:id])
    end

    private

    def permitted_params
      params.permit(:search, :page)
    end
  end
end
