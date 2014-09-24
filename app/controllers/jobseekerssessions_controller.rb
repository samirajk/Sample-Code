class JobseekerssessionsController < ApplicationController
  def new

  end

  def create

    jobseeker = Jobseeker.authenticate(params[:email], params[:password])
    if jobseeker
      session[:user_id] = jobseeker.id
      redirect_to :controller => "jobseekers", :action => "index", :notice => "Logged in!"

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
