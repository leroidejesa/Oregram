class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show

  end

  def new
    @image = current_user.images.build
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      flash[:notice] = "Upload successful!"
      redirect_to images_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def image_params
    params.require(:image).permit(:description)
  end
end
