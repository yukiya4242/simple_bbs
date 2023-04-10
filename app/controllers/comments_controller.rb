class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to post_path(@post), notice: 'コメントが投稿されました'
    else
      redirect_to post_path(@post), alert: 'コメントの投稿に失敗しました'
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def new
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  
end
