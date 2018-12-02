module SendFeedbackOrginize
  class NoticeAdmin
    include Interactor

    def call
      feedback = context.feedback
      FeedbackMailer.admin_email(feedback).deliver
    end
  end
end
