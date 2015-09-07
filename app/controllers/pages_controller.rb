class PagesController < ApplicationController
  skip_before_filter :require_login, only: [:home, :contact, :help]
  def home
    @products = Product.search(params[:search]).page(params[:page]).per_page(10)

  end

  def treeview
  end

  def contact
  end

  def help
  end


  
end
