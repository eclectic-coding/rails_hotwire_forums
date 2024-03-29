module Discussions
  class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_discussion
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def show
    end

    def create
      @post = @discussion.posts.new(post_params)

      respond_to do |format|
        if @post.save
          if params.dig('post', 'redirect').present?
            @pagy, @posts = pagy(@discussion.posts.order(created_at: :desc), items: 5)
            format.html { redirect_to discussion_path(@discussion, page: @pagy.last), notice: "Post created" }
          else
            @post = @discussion.new
            format.turbo_stream
          end
        else
          format.turbo_stream
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def edit
    end

    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post.discussion, notice: "Post updated" }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @post.destroy

      respond_to do |format|
        format.turbo_stream {} # let the callback delete the post
        format.html { redirect_to @post.discussion, notice: "Post deleted" }
      end
    end

    private

    def post_params
      params.require(:post).permit(:body)
    end

    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

    def set_post
      @post = @discussion.posts.find(params[:id])
    end
  end
end
