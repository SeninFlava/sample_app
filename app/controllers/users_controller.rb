class UsersController < ApplicationController
  
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def new
  	@user = User.new
  end
  
  def show
  	@user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  

  def index
     
      @users = User.paginate(page: params[:page])
    
  end

    

  def create 
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      #f[:a] = "b"
      redirect_to @user
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end


  def destroy
    user = User.find(params[:id])
    if !user.nil? 
      user.destroy
    end
    flash[:success] = "User \"#{user.name}\" deleted"
    redirect_to users_url
  end

  def set_admin
    
    user = User.find(params[:id])
    user.admin = !user.admin
    user.save

    redirect_back_user user
  end


  private

  	def user_params 
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end


    def correct_user
      @user = User.find(params[:id])
      if !current_user.admin
        if !current_user?(@user)
           redirect_to(root_url)
        end
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
        

end
