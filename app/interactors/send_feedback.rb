class SendFeedback
  include Interactor::Organizer

  organize SendFeedbackOrginize::CreateFeedback, SendFeedbackOrginize::NoticeAdmin
end
