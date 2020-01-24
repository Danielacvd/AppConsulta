class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
    @paciente = Paciente.find(params[:paciente_id])
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @paciente = @test.pacientes
  end

  # GET /tests/new
  def new
    @paciente = Paciente.find(params[:paciente_id])
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
    @paciente = @test.pacientes
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)
    @test.pacientes = Paciente.find(params[:test][:paciente_id])

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    @test.pacientes = Paciente.find(params[:test][:paciente_id])
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to paciente_tests_path(@paciente), notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:name, :photo, :diag)
    end
end
