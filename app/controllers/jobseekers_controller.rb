class JobseekersController < ApplicationController
  before_action :set_jobseeker, only: [:show, :edit, :update, :destroy]
  def current_user
    @_current_user ||= session[:current_user_id] &&
        Jobseeker.find(session[:current_user_id])
  end

  # GET /jobseekers
  # GET /jobseekers.json
  def index
    session[:current_user_id]=session[:user_id]

    @jobseekers = Jobseeker.all
  end

  # GET /jobseekers/1
  # GET /jobseekers/1.json
  def show


  end

  # GET /jobseekers/new
  def new
    @jobseeker = Jobseeker.new
  end

  # GET /jobseekers/1/edit
  def edit
  end

  # POST /jobseekers
  # POST /jobseekers.json
  def create
    @jobseeker = Jobseeker.new(jobseeker_params)

    respond_to do |format|
      if @jobseeker.save
        format.html { redirect_to @jobseeker, notice: 'Jobseeker was successfully created. Signed Up! .' }
        format.json { render :show, status: :created, location: @jobseeker }
      else
        format.html { render :new }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobseekers/1
  # PATCH/PUT /jobseekers/1.json
  def update
    respond_to do |format|
      if @jobseeker.update(jobseeker_params)
        format.html { redirect_to @jobseeker, notice: 'Jobseeker was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobseeker }
      else
        format.html { render :edit }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobseekers/1
  # DELETE /jobseekers/1.json
  def destroy
    @jobseeker.destroy
    respond_to do |format|
      format.html { redirect_to jobseekers_url, notice: 'Jobseeker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobseeker
      if params[:id].nil? # if there is no user id in params, show current one
        @jobseeker = current_user
      else # if there is the user id in params just use it,
        # maybe get 'authorization failed'
        @jobseeker = Jobseeker.find params[:id]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobseeker_params
      params.require(:jobseeker).permit(:name, :email, :password, :password_confirmation, :password_hash, :password_salt, :phonenumber, :skills, :resume)
    end
end
