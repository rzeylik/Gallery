class ImagesController < ApplicationController
  def index
    redirect_to new_category_image_path
  end

  def new
    @category = Category.find(params[:category_id])
    @image = @category.images.build
  end

  def show
    @category = Category.find(params[:category_id])
    @image = Image.find(params[:id])

    @img = Magick::Image.read(@image.image.path).first
    @pix = @img.scale(1, 1)
    @avg_color = @pix.to_color(@pix.pixel_color(0,0))
  end

  def destroy
    @category = Category.find(params[:category_id])
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to @category
  end

  def create
    @category = Category.find(params[:category_id])
    @image = @category.images.build(image_params)
    if @image.save
      redirect_to @category
    else
      render :new
    end

  end

  private
  def image_params
    params.require(:image).permit(:title, :image)
  end
end
