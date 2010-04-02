module Admin
  class Admin::UsersController < ApplicationController
    access_control do
      allow :admin
    end

    def index
      @users = User.paginate(:page => params[:page])
    end
  end
end