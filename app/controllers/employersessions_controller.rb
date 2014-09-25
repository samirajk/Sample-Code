class EmployersessionsController < ApplicationController
  layout 'employer'
  def new
    render :layout => 'employer'
  end

  def create
    employer = Employer.authenticate(params[:email], params[:password])
    if employer
      session[:user_id] = employer.id
      redirect_to :controller => "employers", :action => "homepage", :notice => "Logged in!", :id => employer.id
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
