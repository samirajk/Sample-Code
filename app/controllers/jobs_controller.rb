class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  #layout 'employer'
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  def jobsbyemployer
    @jobs = Job.where("employers_id = ?", session[:user_id])
  end
  # GET /jobs/new
  def new
    @job = Job.new
    @category = Category.all
    @tags = Tag.all
  end

  # GET /jobs/1/edit
  def edit
    @category = Category.all
    @tags = Tag.all
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.tags_id = job_params[:tags_id].slice(1,job_params[:tags_id].length).join(",")
    @job.employers_id = session[:user_id]
    respond_to do |format|
      if @job.save
        job_params[:tags_id].each do|x|
          if x!=""
            @jobtag = Jobtag.new
            @jobtag.job_id = @job.id
            @jobtag.tag_id = x
            @jobtag.save
          end
        end
        format.html { redirect_to emp_homepage_path, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update

    tp = job_params
    tp[:tags_id] = job_params[:tags_id].slice(1,job_params[:tags_id].length).join(",")
    tp[:employers_id] = session[:user_id]


    respond_to do |format|
      if @job.update(tp)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :application_deadline,:employers_id ,:category_id, tags_id: [])
    end
end
