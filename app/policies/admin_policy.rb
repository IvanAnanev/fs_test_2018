class AdminPolicy < Struct.new(:user, :admin)
  def admin?
    user&.role == "admin"
  end
end
