module Admin
  class Admin::UsersController < Admin::BaseController
    before_filter :require_user

    def index
      @users = User.paginate(:page => params[:page])
    end
  end
end