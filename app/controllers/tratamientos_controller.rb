class TratamientosController < ApplicationController
  before_action :set_tratamiento, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tratamientos
  # GET /tratamientos.json
  def index
    @paciente = Paciente.find(params[:paciente_id])
  end

  # GET /tratamientos/1
  # GET /tratamientos/1.json
  def show
  end

  # GET /tratamientos/new
  def new
    @paciente = Paciente.find(params[:paciente_id])
    @tratamiento = Tratamiento.new
  end

  # GET /tratamientos/1/edit
  def edit
    @paciente = @tratamiento.paciente
  end

  # POST /tratamientos
  # POST /tratamientos.json
  def create
    @tratamiento = Tratamiento.new(tratamiento_params)
    @tratamiento.paciente = Paciente.find(params[:tratamiento][:paciente_id])


    respond_to do |format|
      if @tratamiento.save
        format.html { redirect_to paciente_tratamiento_sesion_colegios_path(@tratamiento.paciente, @tratamiento), notice: 'Tratamiento was successfully created.' }
        format.json { render :show, status: :created, location: @tratamiento }
      else
        format.html { render :new }
        format.json { render json: @tratamiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tratamientos/1
  # PATCH/PUT /tratamientos/1.json
  def update
    @tratamiento.paciente = Paciente.find(params[:tratamiento][:paciente_id])
    respond_to do |format|
      if @tratamiento.update(tratamiento_params)
        format.html { redirect_to paciente_tratamientos_path(@tratamiento.paciente), notice: 'Tratamiento was successfully updated.' }
        format.json { render :show, status: :ok, location: @tratamiento }
      else
        format.html { render :edit }
        format.json { render json: @tratamiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tratamientos/1
  # DELETE /tratamientos/1.json
  def destroy
    @paciente = @tratamiento.paciente
    @tratamiento.destroy
    respond_to do |format|
      format.html { redirect_to paciente_tratamientos_path(@tratamiento.paciente), notice: 'Tratamiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tratamiento
      @tratamiento = Tratamiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tratamiento_params
      params.require(:tratamiento).permit(:name, :plan)
    end
end
