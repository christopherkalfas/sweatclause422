class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end
    
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
        # session[:user_id]
        cookies[:auth_token]
      end

      def current_user?(user)
        user == current_user
      end

      helper_method :current_user
      helper_method :current_user?
      helper_method :logged_in?


end
