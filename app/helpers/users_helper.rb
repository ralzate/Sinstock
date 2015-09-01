module UsersHelper
  def activated_user
    unless current_user.activation_state == "active" || current_user.admin
      flash[:danger] = "Please activate your account"
      redirect_to products_path
    end
  end

  def correct_user
    unless current_user.admin? || @product = current_user.products.find_by(id: params[:id])
      flash[:danger] = "You don't have the rights to do that!"
      redirect_to products_path
    end
  end

  def current_user?
    unless current_user == User.find_by(id: params[:id]) || current_user.admin
      flash[:danger] = "You don't have the rights to do that!"
      if logged_in?
        redirect_to users_path
      else
        redirect_to root_url
      end
    end
  end
end
