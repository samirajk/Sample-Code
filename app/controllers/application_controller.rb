  class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_jobseeker, :current_employer
  def current_user
    if (session[:user_id].nil?)
      session[:user_id] = 0 ;
    end
    if(Admin.find_by_id (session[:user_id]))
      @current_user ||= Admin.find(session[:user_id]) if session[:user_id]
   end
  end
  def current_jobseeker
    if (session[:user_id].nil?)
      session[:user_id] = 0 ;
    end
    if(Jobseeker.find_by_id (session[:user_id]))
      @current_jobseeker ||= Jobseeker.find(session[:user_id]) if session[:user_id]
    end
  end
  def current_employer
    if (session[:user_id].nil?)
      session[:user_id] = 0 ;
    end
    if(Employer.find_by_id (session[:user_id]))
      @current_employer ||= Employer.find(session[:user_id]) if session[:user_id]
    end
  end
end
