class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "defoult_image.jpg"
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Travel Hub"
      redirect_to("/")
    else
      render("users/new")
    end
  end

  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "You succeeded in login"
      redirect_to("/")
    else
      flash[:notice] = "We couldn't search for your email or password"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You succeeded in logout"
    redirect_to("/")
  end

  def show
    @user = User.find_by(id: @current_user.id)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    image = params[:photo]
    if image
      @user.image_name = "#{@user.id}.jpg"
      File.binwrite("public/user_image/#{@user.image_name}", image.read)
      flash[:notice] = "You succeeded in update"
    end
    if @user.save
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "※"
      render("users/edit")
    end
  end

  def delete
    @user = User.find_by(id: params[:id])
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "You succeeded in delete"
    redirect_to("/")
  end
end
