class PostCommentsController < ApplicationController
  
  def create
   post_image = PostComment.find(params[:post_image_id])
   comment = current_user.post_comments.new(post_comments_params)
   comment.post_image_id = post_image.id
   comment.save
   redirect_to post_image_path(post_image)
  end 
  
  def destory
   PostComment.find(params[:id]).destory
   redirect_to post_image_path(params[:post_image_id])
  
  private
  
  def post_comments_params
    params.require(:post_comment).permit(:comment)
  end 
   
end
