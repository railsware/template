# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
    
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = I18n.translate "flashes.account_created"
      redirect_back_or_default root_path
    else
      flash[:error] = I18n.translate "flashes.account_create_update_error"
      redirect_to new_user_path
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = I18n.translate "flashes.account_created"
      redirect_back_or_default user_path(@user)
    else
      flash[:error] = I18n.translate "flashes.account_create_update_error"
      redirect_to edit_user_path(@user)
    end
  end
end