class SectorCategoriesController < ApplicationController
  before_action :set_sector_category, only: [:show, :edit, :update, :destroy]

  def index
    @sector_categories = SectorCategory.all
  end

  def show
  end

  def new
    @sector_category = SectorCategory.new
  end

  def edit
  end

  def create
    @sector_category = SectorCategory.new(sector_category_params)

    respond_to do |format|
      if @sector_category.save
        format.html { redirect_to @sector_category, notice: 'Sector category was successfully created.' }
        format.json { render :show, status: :created, location: @sector_category }
      else
        format.html { render :new }
        format.json { render json: @sector_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sector_category.update(sector_category_params)
        format.html { redirect_to @sector_category, notice: 'Sector category was successfully updated.' }
        format.json { render :show, status: :ok, location: @sector_category }
      else
        format.html { render :edit }
        format.json { render json: @sector_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sector_category.destroy
    respond_to do |format|
      format.html { redirect_to sector_categories_url, notice: 'Sector category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_sector_category
      @sector_category = SectorCategory.find(params[:id])
    end

    def sector_category_params
      params.require(:sector_category).permit(:name, :description)
    end
end
