class CommentsController < ApplicationController
 
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    # authorize @comment
  end

  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    # authorize @comment
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved successfully."
    else
      flash[:error] = "Error creating comment.  Please try again."
      render :new
    end 
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    # authorize @comment
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    # authorize @comment
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    # authorize @comment
    if @comment.update_attributes(comment_params)
      
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
