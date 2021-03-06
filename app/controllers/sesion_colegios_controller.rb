class SesionColegiosController < ApplicationController
  before_action :set_sesion_colegio, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /sesion_colegios
  # GET /sesion_colegios.json
  def index
    @sesiones_colegio = SesionColegio.where('tratamiento_id = ?',  params[:tratamiento_id])
    @tratamiento = Tratamiento.find(params[:tratamiento_id])
  end

  # GET /sesion_colegios/1
  # GET /sesion_colegios/1.json
  def show
    @tratamiento = @sesion_colegio.tratamiento
  end

  # GET /sesion_colegios/new
  def new
    @sesion_colegio = SesionColegio.new
    @tratamiento = Tratamiento.find(params[:tratamiento_id])
  end

  # GET /sesion_colegios/1/edit
  def edit
    @tratamiento = @sesion_colegio.tratamiento
  end

  # POST /sesion_colegios
  # POST /sesion_colegios.json
  def create
    @sesion_colegio = SesionColegio.new(sesion_colegio_params)
    @sesion_colegio.tratamiento = Tratamiento.find(params[:sesion_colegio][:tratamiento_id])

    respond_to do |format|
      if @sesion_colegio.save
        format.html { redirect_to paciente_tratamiento_sesion_colegios_path(@sesion_colegio.tratamiento.paciente ,@sesion_colegio.tratamiento), notice: 'Sesion colegio was successfully created.' }
        format.json { render :show, status: :created, location: @sesion_colegio }
      else
        format.html { render :new }
        format.json { render json: @sesion_colegio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sesion_colegios/1
  # PATCH/PUT /sesion_colegios/1.json
  def update
      @sesion_colegio.tratamiento = Tratamiento.find(params[:sesion_colegio][:tratamiento_id])
    respond_to do |format|
      if @sesion_colegio.update(sesion_colegio_params)
        format.html { redirect_to @sesion_colegio, notice: 'Sesion colegio was successfully updated.' }
        format.json { render :show, status: :ok, location: @sesion_colegio }
      else
        format.html { render :edit }
        format.json { render json: @sesion_colegio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sesion_colegios/1
  # DELETE /sesion_colegios/1.json
  def destroy
    @tratamiento = @sesion_colegio.tratamiento
    @sesion_colegio.destroy
    respond_to do |format|
      format.html { redirect_to paciente_tratamiento_sesion_colegios_path(@sesion_colegio.tratamiento.paciente ,@sesion_colegio.tratamiento), notice: 'Sesion colegio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sesion_colegio
      @sesion_colegio = SesionColegio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sesion_colegio_params
      params.require(:sesion_colegio).permit(:cita, :descripcion, :numero_cita)
    end
end
