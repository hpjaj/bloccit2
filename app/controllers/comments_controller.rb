class CommentsController < ApplicationController
 
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "Comment failed to save."
    end 
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Your comment was deleted."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was a problem deleting your comment.  Please try again."
      redirect_to [@topic, @post]
    end
      
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
