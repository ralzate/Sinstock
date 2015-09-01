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
    @manage_user = ManageUser.new(manage_user_params)
    if @manage_user.save
      redirect_to(@manage_user, notice: 'User was successfully created.')
    else
      render :new
    end
  end

  def update
    @manage_user.update(manage_user_params)
    respond_with(@manage_user)
  end

  def destroy
    @manage_user.destroy
    respond_with(@manage_user)
  end

  private
    def set_manage_user
      @manage_user = ManageUser.find(params[:id])
    end

    def manage_user_params
      params.require(:manage_user).permit(:user_id, :rol_id)
    end
end
