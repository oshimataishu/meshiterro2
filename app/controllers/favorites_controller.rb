class FavoritesController < ApplicationController
  def create
    postimage = Postimage.find(params[:postimage_id])
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.postimage_id = postimage.id
    favorite.save

    redirect_to postimage_path(favorite.postimage_id)
  end

  def destroy
    postimage = Postimage.find(params[:postimage_id])
    favorite = current_user.favorites.find_by(postimage_id: postimage.id)
    favorite.destroy
    redirect_to postimage_path(favorite.postimage_id)
  end


end
