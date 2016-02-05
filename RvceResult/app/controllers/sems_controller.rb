class SemsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_sem, only: [:show, :edit, :update, :destroy]

  # GET /sems
  # GET /sems.json
  def index
    @sems = Sem.all

  end

  # GET /sems/1
  # GET /sems/1.json
  def show
  end

  # GET /sems/new
  def new
    @sem = Sem.new
    @department = Department.all
  end

  # GET /sems/1/edit
  def edit
    @department = Department.all
  end

  # POST /sems
  # POST /sems.json
  def create
    @sem = Sem.new(sem_params)
    respond_to do |format|
      if @sem.save
        format.html { redirect_to @sem, notice: 'Sem was successfully created.' }
        format.json { render :show, status: :created, location: @sem }
      else
        format.html { render :new }
        format.json { render json: @sem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sems/1
  # PATCH/PUT /sems/1.json
  def update
    respond_to do |format|
      if @sem.update(sem_params)
        format.html { redirect_to @sem, notice: 'Sem was successfully updated.' }
        format.json { render :show, status: :ok, location: @sem }
      else
        format.html { render :edit }
        format.json { render json: @sem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sems/1
  # DELETE /sems/1.json
  def destroy
    @sem.destroy
    respond_to do |format|
      format.html { redirect_to sems_url, notice: 'Sem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sem
      @sem = Sem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sem_params
      params.require(:sem).permit(:sname, :year, :department_id, :result1)
    end
end
