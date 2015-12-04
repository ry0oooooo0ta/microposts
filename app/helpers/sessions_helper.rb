module SessionsHelper
    def current_user
        @current_user ||=User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !! current_user
    end
    
    def store_location
        session[:forwarding_url] = request.url if request.get?
    end
    
    def logged_in_user
    　unless logged_in?
      　store_location
      　flash[:danger] = "Please log in."
      　redirect_to login_url
    　end
    end
end