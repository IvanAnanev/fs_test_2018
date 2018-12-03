shared_context "current user signed in" do
  let(:current_user) { create :user }

  background do
    login_as current_user
  end
end

shared_context "admin signed in" do
  let(:admin) { create :user, :admin }

  background do
    login_as admin
  end
end
