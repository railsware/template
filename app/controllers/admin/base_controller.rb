module Admin
  class Admin::BaseController < ApplicationController
    access_control :base_acl do
      allow :admin
    end if Settings.perform_authentication

    rescue_from 'Acl9::AccessDenied', :with => :access_denied

    private
    def access_denied
      if current_user
        redirect_to new_admin_user_session_path
        #TODO: Show access denied page
        #render :template => 'shared/access_denied'
      else
        flash[:notice] = I18n.translate "flashes.access_denied"
        redirect_to new_admin_user_session_path
      end
    end

  end
end
