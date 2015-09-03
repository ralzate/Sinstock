class TypeProductsController < ApplicationController
  before_action :set_type_product, only: [:show, :edit, :update, :destroy]

  def index
    @type_products = TypeProduct.search(params[:search]).page(params[:page]).per_page(5)
  end

  def show
  end

  def new
    @type_product = TypeProduct.new
  end

  def edit
  end

  def create
    @type_product = TypeProduct.new(type_product_params)

    respond_to do |format|
      if @type_product.save
        format.html { redirect_to @type_product, notice: 'Tipo Producto creado correctamente.' }
        format.json { render :show, status: :created, location: @type_product }
      else
        format.html { render :new }
        format.json { render json: @type_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @type_product.update(type_product_params)
        format.html { redirect_to @type_product, notice: 'Tipo Producto actualizado correctamente..' }
        format.json { render :show, status: :ok, location: @type_product }
      else
        format.html { render :edit }
        format.json { render json: @type_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @type_product.destroy
    respond_to do |format|
      format.html { redirect_to type_products_url, notice: 'Tipo Producto eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_type_product
      @type_product = TypeProduct.find(params[:id])
    end

    def type_product_params
      params.require(:type_product).permit(:name, :description)
    end
end
