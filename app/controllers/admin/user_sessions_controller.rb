module Admin
  class UserSessionsController < ApplicationController
    before_filter :require_no_user, :only => [:new, :create]
    before_filter :require_user, :only => [:destroy, :not_authorized ]
    layout "user_sessions"

    def new
      @user_session = UserSession.new
    end

    def create
      @admin = User.find_by_login(params[:user_session][:login])
      @user_session = UserSession.new(params[:user_session])
      if @admin && @admin.has_role?(:admin)
        if @user_session.save
          flash[:notice] = I18n.translate "flashes.logged_in"
          redirect_to admin_users_path
        else
          flash[:error] = I18n.translate "flashes.login_error"
          redirect_to new_admin_user_session_path
        end
      else
        flash[:error] = I18n.translate "flashes.access_denied"
        redirect_to new_admin_user_session_path
      end
    end
  end
end