class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_filter :require_login, only: [:show, :index]
  #before_action :activated_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :activated_user, except: [:show, :index]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @products = Product.paginate(page: params[:page] )
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { flash[:success] = 'Producto se ha creado correctamente.'
                      redirect_to @product  }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { flash[:success] = 'Producto se ha actualizado correctamente.'
                      redirect_to @product }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { flash[:success] = 'Producto fue eliminado con éxito.'
                    redirect_to products_url
                     }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :image_file, :price )
    end
end
