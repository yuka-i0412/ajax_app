class PostsController < ApplicationController
  def index 
    @posts = Post.all.order(id: "DESC")
     # 全てのレコードを@postsに代入+降順で表示
  end
  
  #削除
  #def new
  #end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
  end

  def checked
    post = Post.find(params[:id])
    if post.checked then
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json:{ post: item}
  end
end
