require 'csv'


class ResultsController < ApplicationController
  before_filter :authenticate_user!,except: [:getresult,:showresult]
  before_action :set_result, only: [:show, :edit, :update, :destroy]

  # GET /results
  # GET /results.json
  def index
    @results = Result.all
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
   
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
   
    redirect_to :controller => 'results' ,:action => "showresult",:row => result.to_s, :status => ""
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def showresult

    @result = Result.new(result_params)
    puts @result.usn 
    puts @result.department 
    puts @result.sem
    sem = Sem.where(:sname => @result.sem, :department_id=> @result.department, :year => @result.year).first
    puts "--------------------------------------"
    puts sem
    if !sem.nil?
      puts sem.result1.url(:original, timestamp: false)
      url = sem.result1.url(:original,timestamp: false)
      puts url
      csv_text = File.new("#{Rails.root}/public"+url)
      csv = CSV.parse(csv_text, :headers=>true)
      @row = Hash.new
      csv.each do |row|
          if row["USN"]== @result.usn.strip.upcase
             puts row
             @row = row.to_hash
            break
          else
              puts "not found"  
          end
      end
    else
      flash[:error] = 'Opps Result Not Found'
      redirect_to :controller => 'results' ,:action => "getresult"
    end
  

      # @row = eval (params[:row])

  end

  def getresult
    @result = Result.new
    @sem = Sem.all
    @department = Department.all

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def result_params
      params.require(:result).permit(:usn, :department, :branch, :sem, :year)
    end
end
