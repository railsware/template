class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:destroy, :not_authorized ] 

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = I18n.translate "flashes.logged_in"
      redirect_to root_path
    else
      flash[:error] = I18n.translate "flashes.login_error"
      redirect_to login_path
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = I18n.translate "flashes.user_session.destroyed"
    redirect_to root_url
  end
end