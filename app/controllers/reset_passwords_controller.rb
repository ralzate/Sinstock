class ResetPasswordsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    @user.deliver_reset_password_instructions! if @user
    flash[:success] = 'Instrucciones han sido enviado a su correo electrónico.'
    redirect_to login_path
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    not_authenticated && return if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password!(params[:user][:password])
      flash[:success] = 'Contraseña se ha actualizado correctamente.'
      redirect_to root_path
    else
      render "edit"
    end
  end
end
