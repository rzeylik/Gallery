class SimilarImagesController < ApplicationController
  def index
    redirect_to new_category_image_similar_image_path
  end

  def new
    @category = Category.find(params[:category_id])
    @image = Image.find(params[:image_id])
    @similar_image = @image.similar_images.build
  end

  def create
    @category = Category.find(params[:category_id])
    @image = Image.find(params[:image_id])
    @similar_image = @image.similar_images.build(similar_image_params)
    if @similar_image.save
      redirect_to category_image_path(@category, @image)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @image = Image.find(params[:image_id])
    @similar_image = SimilarImage.find(params[:id])

    @img = Magick::Image.read(@similar_image.image.path).first
    @pix = @img.scale(1, 1)
    @avg_color = @pix.to_color(@pix.pixel_color(0,0))
  end

  def destroy
    @category = Category.find(params[:category_id])
    @image = Image.find(params[:image_id])
    @similar_image = SimilarImage.find(params[:id])
    @similar_image.destroy
    redirect_to category_image_path(@category, @image)
  end

  private
  def similar_image_params
    params.require(:similar_image).permit(:title, :image)
  end
end
