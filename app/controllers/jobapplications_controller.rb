class JobapplicationsController < ApplicationController
  before_action :set_jobapplication, only: [:show, :edit, :update, :destroy]

  layout :resolve_layout

  def resolve_layout
    case action_name
      when "applicationbyjob"
        "employer"
      else
        "application"
    end
  end

  # GET /jobapplications
  # GET /jobapplications.json
  def index
    @jobapplications = Jobapplication.all
  end
  def jobseekerindex

    @jobapplications = Jobapplication.where("jobseeker_id = ?", session[:user_id])
   # @jobapplications = Jobapplication.find_by_jobseeker_id()
   # @jobapplications = Jobapplication.find_by_jobseeker_id(1)
  end
  # GET /jobapplications/1
  # GET /jobapplications/1.json
  def show
    #flash.now.alert = current_user

  end
    #flash.now.alert = current_user
  def applicationbyjob
    @list = Jobapplication.where("job_id = ?",params[:id])
  end
  # GET /jobapplications/new
  def new

    @jobapplication = Jobapplication.new
    flash[:job_id] = request.path_parameters[:format]
    #render :text=>flash[:job_id].class
  end

  # GET /jobapplications/1/edit
  def edit
  end

  def editstatus
    @list = Jobapplication.find(params[:id])
  end
  # POST /jobapplications
  # POST /jobapplications.json
  def create
    @jobapplication = Jobapplication.new(jobapplication_params)
    #render :text=>@jobapplication.job_id
    respond_to do |format|
      @jobapplication.jobseeker_id = session[:user_id]
      @jobapplication.job_id = flash[:job_id].to_i
      @jobapplication.status = "Applied"
      if @jobapplication.save
        format.html { redirect_to @jobapplication, notice: 'Job application was successfully created.' }
        format.json { render :show, status: :created, location: @jobapplication }
      else
        format.html { render :new }
        format.json { render json: @jobapplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobapplications/1
  # PATCH/PUT /jobapplications/1.json
  def update
    respond_to do |format|
      if(!Employer.where("Id = ?",session[:user_id]))
        if @jobapplication.update(jobapplication_params)
          format.html { redirect_to @jobapplication, notice: 'Job application was successfully updated.' }
          format.json { render :show, status: :ok, location: @jobapplication }

        else
          format.html { render :edit }
          format.json { render json: @jobapplication.errors, status: :unprocessable_entity }
        end
      else
        if @jobapplication.update(jobapplication_params)
          #send status update mail
          Notifier.send_email_to_applicant(@jobapplication.jobseeker.username,@jobapplication.job.title,@jobapplication.job.employer.company).deliver
          flash[:notice] = 'Successfully Changed !'
          format.html { redirect_to controller: "jobapplications" , action: "applicationbyjob" , :id =>  @jobapplication.job.id }
          format.json { render :show, status: :ok, location: @jobapplication }
        else
          format.html { render :edit }
          format.json { render json: @jobapplication.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /jobapplications/1
  # DELETE /jobapplications/1.json
  def destroy
    @jobapplication.destroy
    respond_to do |format|
      format.html { redirect_to jobapplications_url, notice: 'Job application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobapplication
      @jobapplication = Jobapplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobapplication_params
      params.require(:jobapplication).permit(:coverletter, :dateofapplication, :status, :job_id, :jobseeker_id)
    end
end
