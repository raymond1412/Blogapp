class PostsController < ApplicationController

   #before_filter :authenticate_user!, except: [:index, :show]
   #before_action :authenticate_user!


	 def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to posts_path

    end

    def upvote
    @post = Post.find(params[:id])
   # @comment = @post.comment.find(params[:post_id])
    @post.upvote_by current_user
    redirect_to posts_path
    end

    def downvote
     @post = Post.find(params[:id])
    # @comment = @post.comment.find(params[:post_id])
     @post.downvote_by current_user
     redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end


end
