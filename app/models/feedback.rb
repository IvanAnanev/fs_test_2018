class Feedback < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp, message: "only email format" }
  validates :text,  presence: true
end
