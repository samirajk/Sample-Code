class JobtagsController < ApplicationController
  before_action :set_jobtag, only: [:show, :edit, :update, :destroy]

  # GET /jobtags
  # GET /jobtags.json
  def index
    @jobtags = Jobtag.all
  end

  # GET /jobtags/1
  # GET /jobtags/1.json
  def show
  end

  # GET /jobtags/new
  def new
    @jobtag = Jobtag.new
  end

  # GET /jobtags/1/edit
  def edit
  end

  # POST /jobtags
  # POST /jobtags.json
  def create
    @jobtag = Jobtag.new(jobtag_params)

    respond_to do |format|
      if @jobtag.save
        format.html { redirect_to @jobtag, notice: 'Jobtag was successfully created.' }
        format.json { render :show, status: :created, location: @jobtag }
      else
        format.html { render :new }
        format.json { render json: @jobtag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobtags/1
  # PATCH/PUT /jobtags/1.json
  def update
    respond_to do |format|
      if @jobtag.update(jobtag_params)
        format.html { redirect_to @jobtag, notice: 'Jobtag was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobtag }
      else
        format.html { render :edit }
        format.json { render json: @jobtag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobtags/1
  # DELETE /jobtags/1.json
  def destroy
    @jobtag.destroy
    respond_to do |format|
      format.html { redirect_to jobtags_url, notice: 'Jobtag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobtag
      @jobtag = Jobtag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobtag_params
      params.require(:jobtag).permit(:job_id, :tag_id)
    end
end
