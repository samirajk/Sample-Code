class EmployersessionsController < ApplicationController
  def new
  end

  def create
    employer = Employer.authenticate(params[:email], params[:password])
    if employer
      session[:user_id] = employer.id
      redirect_to root_url, :notice => "Logged in!"
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
