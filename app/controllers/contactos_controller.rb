class ContactosController < InheritedResources::Base
  before_action :set_contacto, only: [:show, :edit, :update, :destroy]

  def index

    authenticate_user!
    if current_user.admin?
      @contactos = Contacto.all
    else
      redirect_to root_path, notice: 'No tiene permisos para ver los mensajes.'
    end

  end


  def create
    @contacto = Contacto.new(contacto_params)

    respond_to do |format|
      if @contacto.save
        format.html { redirect_to root_path, notice: 'Su mensaje se ha guardado.' }
        format.json { render :show, status: :created, location: @contacto }
      else
        format.html { render :new }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_contacto
      @contacto = Contacto.find(params[:id])
    end

    def contacto_params
      params.require(:contacto).permit(:nombre, :apellido, :correo, :mensaje)
    end

end
