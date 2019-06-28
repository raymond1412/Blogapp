class CommentsController < ApplicationController

     #before_filter :authenticate_user!, :except => [:index, :show]

	def create
        @post = Post.find(params[:post_id])
         @comment = @post.comments.create(params[:comment].permit(:name, :comment))
        redirect_to post_path(@post)
    end


    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end

    def upvote
    @post = Post.find(params[:id])
    @comment = @post.comment.find(params[:post_id])
    @post.upvote_by current_user
    redirect_to posts_path
    end

    def downvote
     @post = Post.find(params[:id])
     @comment = @post.comment.find(params[:post_id])
     @post.downvote_by current_user
     redirect_to posts_path
    end

end
