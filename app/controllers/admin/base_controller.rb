module Admin
  class BaseController < ApplicationController
    before_action :require_be_admin

    private

    def require_be_admin
      authorize :admin, :admin?
    end
  end
end
