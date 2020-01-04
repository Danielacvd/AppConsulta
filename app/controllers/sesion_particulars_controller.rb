class SesionParticularsController < ApplicationController
  before_action :set_sesion_particular, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sesion_particulars
  # GET /sesion_particulars.json
  def index
    @sesion_particulars = SesionParticular.all
  end

  # GET /sesion_particulars/1
  # GET /sesion_particulars/1.json
  def show
  end

  # GET /sesion_particulars/new
  def new
    @sesion_particular = SesionParticular.new
  end

  # GET /sesion_particulars/1/edit
  def edit
  end

  # POST /sesion_particulars
  # POST /sesion_particulars.json
  def create
    @sesion_particular = SesionParticular.new(sesion_particular_params)

    respond_to do |format|
      if @sesion_particular.save
        format.html { redirect_to @sesion_particular, notice: 'Sesion particular was successfully created.' }
        format.json { render :show, status: :created, location: @sesion_particular }
      else
        format.html { render :new }
        format.json { render json: @sesion_particular.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sesion_particulars/1
  # PATCH/PUT /sesion_particulars/1.json
  def update
    respond_to do |format|
      if @sesion_particular.update(sesion_particular_params)
        format.html { redirect_to @sesion_particular, notice: 'Sesion particular was successfully updated.' }
        format.json { render :show, status: :ok, location: @sesion_particular }
      else
        format.html { render :edit }
        format.json { render json: @sesion_particular.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sesion_particulars/1
  # DELETE /sesion_particulars/1.json
  def destroy
    @sesion_particular.destroy
    respond_to do |format|
      format.html { redirect_to sesion_particulars_url, notice: 'Sesion particular was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sesion_particular
      @sesion_particular = SesionParticular.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sesion_particular_params
      params.require(:sesion_particular).permit(:cita, :descripcion_sesion, :numero_cita)
    end
end
