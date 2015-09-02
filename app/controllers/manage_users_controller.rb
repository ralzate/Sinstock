class ManageUsersController < ApplicationController
  before_action :set_manage_user, only: [:show, :edit, :update, :destroy]

  def index
    @manage_users = ManageUser.all
  end

  def show
    @manage_user = ManageUser.find(params[:id])
  end

  def new
    @manage_user = ManageUser.new
  end

  def edit
    @manage_user = ManageUser.find(params[:id])
  end

  def create
    @manage_user = current_user.manage_users.build(manage_user_params)

    respond_to do |format|
      if @manage_user.save
        format.html { flash[:success] = 'manage_usero se ha creado correctamente.'
                      redirect_to @manage_user  }
        format.json { render :show, status: :created, location: @manage_user }
      else
        format.html { render :new }
        format.json { render json: @manage_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @manage_user.update(manage_user_params)
        format.html { flash[:success] = 'Administración actualizada correctamente.'
                      redirect_to @manage_user }
        format.json { render :show, status: :ok, location: @manage_user }
      else
        format.html { render :edit }
        format.json { render json: @manage_user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    ManageUser.find(params[:id]).destroy
    flash[:success] = "Registro Eliminado"
    redirect_to manage_users_url
  end


  private
    def set_manage_user
      @manage_user = ManageUser.find(params[:id])
    end

    def manage_user_params
      params.require(:manage_user).permit(:user_id, :rol_id)
    end
end
