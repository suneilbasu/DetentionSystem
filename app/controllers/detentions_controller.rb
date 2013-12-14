class DetentionsController < ApplicationController
  before_action :set_detention, only: [:show, :edit, :update, :destroy]

  # GET /detentions
  # GET /detentions.json
  def index
    @pen_detentions = Detention.pen
    @detentions = Detention.upcoming_separated_by_datetime
    @detention = Detention.new
  end

  # GET /detentions/1
  # GET /detentions/1.json
  def show
  end

  # GET /detentions/1/edit
  def edit
  end

  # POST /detentions
  # POST /detentions.json
  def create
    @detention = Detention.new(detention_params)
    @detention.status = "set"
    #TODO: Use logged-in teacher
    @detention.teacher_id = 1
    @detention.parent_detention = 0

    respond_to do |format|
      if @detention.save
        format.json { render action: 'show', status: :created, location: @detention }
      else
        format.json { render json: @detention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detentions/1
  # PATCH/PUT /detentions/1.json
  def update
    respond_to do |format|
      if @detention.update(detention_params)
        format.html { redirect_to @detention, notice: 'Detention was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @detention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detentions/1
  # DELETE /detentions/1.json
  def destroy
    @detention.destroy
    respond_to do |format|
      format.html { redirect_to detentions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detention
      @detention = Detention.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detention_params
      params.require(:detention).permit(:teacher_id, :student_id, :date, :time, :reason, :points, :parent_detention, :status, :additional_notes)
    end
end
