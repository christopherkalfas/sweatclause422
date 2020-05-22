class ApplicationController < ActionController::Base
    def current_user
        user_id = session[:user_id]
        user_id && User.find(user_id)
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
        session[:user_id]
      end

      def current_user?(user)
        user == current_user
      end

      helper_method :current_user
      helper_method :current_user?


end
