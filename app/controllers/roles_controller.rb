class RolesController < ApplicationController
  before_action :set_rol, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Rol.all
  end

  def show
  end

  def new
    @rol = Rol.new
  end

  def edit
  end

  def create
    @rol = Rol.new(rol_params)

    respond_to do |format|
      if @rol.save
        format.html { redirect_to @rol, notice: 'Rol was successfully created.' }
        format.json { render :show, status: :created, location: @rol }
      else
        format.html { render :new }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rol.update(rol_params)
        format.html { redirect_to @rol, notice: 'Rol was successfully updated.' }
        format.json { render :show, status: :ok, location: @rol }
      else
        format.html { render :edit }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rol.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Rol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_rol
      @rol = Rol.find(params[:id])
    end

    def rol_params
      params.require(:rol).permit(:name, :description)
    end
end
