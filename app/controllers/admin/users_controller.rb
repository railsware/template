module Admin
  class Admin::UsersController < ApplicationController
    access_control do
      allow :admin
    end

    def index
      @users = User.paginate(:page => params[:page], :order => '`created_at` DESC')
    end
  end
end