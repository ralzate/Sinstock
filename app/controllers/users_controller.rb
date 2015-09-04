class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user?, only: [:edit, :update, :destroy]
  skip_before_filter :require_login, only: [:new, :create, :show]
  before_filter :authorize

  def index
      @users = User.search(params[:search]).page(params[:page]).per_page(3)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { login(params[:user][:email], params[:user][:password])
                      flash[:success] = "Registro exitoso. Por favor revise su correo electrónico para la activación."
                      redirect_back_or_to @user  }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { flash[:danger] = "Registro fallido. Por favor, compruebe los datos que introduces"
                      render :new   }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { flash[:success] = "Perfil actualizado correctamente"
                      redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { flash[:danger] = "Editar perfil falló. Por favor verifique los datos que presentaste."
                      render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { flash[:success] = "Usuario Eliminado."
                    redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      flash[:success] = 'Usuario se activó correctamente.'
      redirect_to @user
    else
      flash[:warning] = 'No se puede activar este usuario'
      redirect_to root_path
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :second_name, :first_surname, :second_surname,
        :identification, :address, :phone, :cell_phone, :rut, :business_name, :nit, :web_page,
        :description, :first_name_of_contact_person, :second_name_of_contact_person, 
        :first_surname_of_contact_person, :second_surname_of_contact_person, 
        :first_phone_of_contact_person, :second_phone_of_contact_person, :email, :password, 
        :password_confirmation, :picture, :type_user, :rol_id)
    end
end
