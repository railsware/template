module Admin
  class Admin::UsersController < ApplicationController
    access_control do
      allow :admin
    end

    def index
      @users = User.all
    end
  end
end