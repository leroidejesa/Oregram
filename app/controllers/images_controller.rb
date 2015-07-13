class ImagesController < ApplicationController
  def index
    @images = Image.all.order(created_at: :desc)
    # @comment = Image.find(params[:id]).comments.new(comment_params)

# sorts array by order created
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = current_user.images.build
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      flash[:notice] = "Upload successful!"
      redirect_to user_path(current_user)
    else

      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])

  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to user_path(current_user)
  end

private
  def image_params
    params.require(:image).permit(:description, :image, :comment)
  end
end
