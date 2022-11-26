class PostcommentsController < ApplicationController
  def create
    postimage = Postimage.find(params[:postimage_id])
    comment = Postcomment.new(postcomment_params)
    comment.user_id = current_user.id
    comment.postimage_id = postimage.id
    comment.save
    redirect_to postimage_path(postimage.id)
  end

  def destroy
    postcomment = Postcomment.find(params[:id])
    postcomment.destroy
    redirect_to postimage_path(postcomment.postimage_id)
  end

  private

  def postcomment_params
    params.require(:postcomment).permit(:comment)
  end
end
