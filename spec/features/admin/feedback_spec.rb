require "rails_helper"

feature "Feedback" do
  include_context "admin signed in"

  scenario "Admin visit feedback" do
    create(:feedback, email: "some@mail.com", text: "Some text feedback")
    create(:feedback, text: "Another text feedback")

    visit admin_feedbacks_path

    expect(page).to have_content("Some text feedback")
    expect(page).to have_content("Another text feedback")

    fill_in "search", with: "Some"
    click_on "Search"

    expect(page).to have_content("Some text feedback")
    expect(page).not_to have_content("Another text feedback")

    click_on "some@mail.com"
    expect(page).to have_content("Some text feedback")
  end
end
