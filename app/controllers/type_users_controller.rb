class TypeUsersController < ApplicationController
  before_action :set_type_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  def index
    @type_users = TypeUser.all
  end

  def show
  end

  def new
    @type_user = TypeUser.new
  end

  def edit
  end

  def create
    @type_user = TypeUser.new(type_user_params)

    respond_to do |format|
      if @type_user.save
        format.html { redirect_to @type_user, notice: 'Tipo Usuario creado correctamente.' }
        format.json { render :show, status: :created, location: @type_user }
      else
        format.html { render :new }
        format.json { render json: @type_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @type_user.update(type_user_params)
        format.html { redirect_to @type_user, notice: 'Tipo Usuario actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @type_user }
      else
        format.html { render :edit }
        format.json { render json: @type_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @type_user.destroy
    respond_to do |format|
      format.html { redirect_to type_users_url, notice: 'Tipo Usuario eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_type_user
      @type_user = TypeUser.find(params[:id])
    end

    def type_user_params
      params.require(:type_user).permit(:name, :description)
    end
end
