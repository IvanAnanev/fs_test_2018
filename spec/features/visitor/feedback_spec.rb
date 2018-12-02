require "rails_helper"

feature "Feedback" do
  before { visit new_feedback_path }

  context "form valid" do
    scenario "Visitor send Feedback" do
      fill_in "feedback_name",  with: "John Doe"
      fill_in "feedback_email", with: "john.doe@email.com"
      fill_in "feedback_text",  with: "Feedback for test!"

      click_on "Submit feedback"

      expect(page).to have_text("Feedback was successfully send!")

      open_last_email

      expect(current_email).to have_text("Feedback for test!")
      expect(current_email).to deliver_from("John Doe <john.doe@email.com>")
      expect(current_email).to have_subject("New feedback from John Doe <john.doe@email.com>")
    end
  end

  context "form no valid" do
    scenario "Visitor sends Feedback" do
      click_on "Submit feedback"

      expect(page).not_to have_text("Feedback was successfully send!")
      expect(page).to have_text("Namecan't be blank")
      expect(page).to have_text("Emailcan't be blank")
      expect(page).to have_text("Text can't be blank")
    end
  end
end
