module Admin
  class UserSessionsController < ApplicationController
    before_filter :require_no_user, :only => [:new, :create]
    before_filter :require_user, :only => [:destroy, :not_authorized ] 

    def new
      @user_session = UserSession.new
    end

    def create
      @admin = User.find_by_login(params[:user_session][:login])
      @user_session = UserSession.new(params[:user_session])
      if @admin && @admin.has_role?(:admin)
        if@user_session.save
          flash[:notice] = I18n.translate "flashes.user_session.created"
          redirect_to admin_users_url
        else
          render :action => :new
        end
      else
        flash[:error] = "Access denied"
        render :action => :new
      end
    end
  end
end