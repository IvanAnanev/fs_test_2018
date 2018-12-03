FactoryGirl.create(:user, email: "user@example.com")
FactoryGirl.create(:user, :admin, email: "admin@example.com")

100.times do
  FactoryGirl.create(:feedback)
end

