class FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite

    if favorite.save
      flash[:notice] = "You have successfully favorited this post."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "The favorite did not save.  Please try again."
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    authorize favorite

    if favorite.destroy
      flash[:notice] = "Successfully unfavorited this post."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Was not able to unfavorite this post.  Please try again."
      redirect_to [@post.topic, @post]
    end
  end

end
