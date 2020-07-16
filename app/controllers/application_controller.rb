class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
    def current_user
        @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end

    # def current_user
    #   @current_user ||= lookup_user
    # end
    
    # def lookup_user
    #   if cookies[:auth_token]
    #     User.find_by_auth_token!(cookies[:auth_token])
    #   elsif session[:user_id]
    #     User.find_by_id(session[:user_id])
    #   end
    # end
    
      def authenticate!
        unless current_user
          flash[:info] = "You have to be logged in to do that!"
          redirect_to login_path
        end
      end

      def authentication_required
        if !logged_in?
          redirect_to login_path
        end
      end

      def logged_in?
        session[:user_id]
        cookies[:auth_token]
      end

      def current_user?(user)
        user == current_user
      end

      def my_tracker?(tracker)
        tracker.user_id == current_user.id
      end 

      helper_method :current_user
      helper_method :current_user?
      helper_method :logged_in?
      helper_method :my_tracker?


end
