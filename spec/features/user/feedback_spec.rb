require "rails_helper"

feature "Feedback" do
  include_context "current user signed in"

  before { visit new_feedback_path }

  context "form valid" do
    scenario "User send Feedback" do
      expect(find_field("feedback_name").value).to eq current_user.full_name
      expect(find_field("feedback_email").value).to eq current_user.email

      fill_in "feedback_text", with: "Feedback for test!"

      click_on "Submit feedback"

      expect(page).to have_text("Feedback was successfully send!")

      open_last_email

      email_address = "#{current_user.full_name} <#{current_user.email}>"

      expect(current_email).to have_text("Feedback for test!")
      expect(current_email).to deliver_from(email_address)
      expect(current_email).to have_subject("New feedback from #{email_address}")
    end
  end

  context "form no valid" do
    scenario "User send Feedback" do
      expect(find_field("feedback_name").value).to eq current_user.full_name
      expect(find_field("feedback_email").value).to eq current_user.email

      click_on "Submit feedback"

      expect(page).not_to have_text("Feedback was successfully send!")
      expect(page).to have_text("Text can't be blank")
    end
  end
end
