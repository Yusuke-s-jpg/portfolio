class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :delete]}

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: params[:title],
      content: params[:content],
      user_id: @current_user.id
    )
    @post.save
    image = params[:photo]
    if image
      @post.photo_name = "#{@post.id}.jpg"
      File.binwrite("public/post_photos/#{@post.photo_name}", image.read)
      flash[:notice] = "You created a new post successfully"
    end
    if @post.save
      redirect_to("/")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def delete
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "You deleted the post successfully"
    redirect_to("/")
  end

  def ensure_correct_user
  @post = Post.find_by(id: params[:id])
  if @current_user.id !=  @post.user_id
    flash[:notice] = "You are not authorized to access this page"
    redirect_to("/")
  end
 end
 
end
