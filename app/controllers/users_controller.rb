class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new( 
      name: params[:name],
      email: params[:email],
      password: params[:password]
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

end
