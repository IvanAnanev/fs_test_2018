module SendFeedbackOrginize
  class CreateFeedback
    include Interactor

    def call
      context.feedback = Feedback.new(context.feedback_params)

      if context.feedback.valid?
        context.feedback.save
      else
        context.fail!
      end
    end
  end
end
