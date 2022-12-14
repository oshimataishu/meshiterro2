class PostimagesController < ApplicationController
  def new
    @postimage = Postimage.new
  end

  def create
    @postimage = Postimage.new(postimage_params)
    @postimage.user_id = current_user.id
    if @postimage.save
      redirect_to postimage_path(@postimage.id)
    else
      render :new
    end
  end

  def index
    @postimages = Postimage.all
  end

  def show
    @postimage = Postimage.find(params[:id])
    @postcomment = Postcomment.new
  end

  def destroy
    @postimage = Postimage.find(params[:id])
    @postimage.destroy
    redirect_to postimages_path
  end

  private

  def postimage_params
    params.require(:postimage).permit(:shop_name, :caption, :image, :user_id)
  end
end
