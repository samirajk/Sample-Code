class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :edit, :update, :destroy]
  # GET /employers
  # GET /employers.json
  layout 'employer'
  def index
    @employers = Employer.all
  end
  def employerindexforadmin
    @employers = Employer.all
  end

  # GET /employers/1
  # GET /employers/1.json
  def show

  end

  def homepage

  end
  # GET /employers/new
  def new

    @employer = Employer.new
    @category = Category.all
    @tags = Tag.all
  end

  # GET /employers/1/edit
  def edit
    render :layout => 'employer'
    @category = Category.all
    @tags = Tag.all
  end

  # POST /employers
  # POST /employers.json
  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      redirect_to admin_index_path(:id => @employer.id) , :notice => "Employer Signed up"
    else
      render "new"
    end
  end

  # PATCH/PUT /employers/1
  # PATCH/PUT /employers/1.json
  def update
    respond_to do |format|
      if @employer.update(employer_params)
        format.html { redirect_to @employer, notice: 'Employer was successfully updated.' }
        format.json { render :show, status: :ok, location: @employer }
      else
        format.html { render :edit }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1
  # DELETE /employers/1.json
  def destroy
    empid = @employer.id
    @employer.destroy
    @jobapplication = Jobapplication.find_by_sql("Select * from jobapplications where job_id in (Select id from jobs where employers_id = #{empid})")
    @jobapplication.each do |x|
      x.destroy
    end
    @jobs = Job.find_by_sql("Select * from jobs where employers_id = #{empid} ")
    @jobs.each do |y|
      y.destroy
    end
    respond_to do |format|
      format.html { redirect_to employerindexforadmin_path, notice: 'Employer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_params
      params.require(:employer).permit(:company, :contact, :email, :password_hash, :password_salt,:password,:password_confirmation, :category_id)
    end
end
