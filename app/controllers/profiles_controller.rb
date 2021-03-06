class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :my_profile, only: [:edit, :update]


  def show
    @pics = @user.pics.order('created_at DESC')
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      flash[:success] = 'プロフィールを変更しました！'
      redirect_to profile_path(@user.user_name)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def favorites
    @favorites = @user.favorites.order('created_at DESC')
  end


  private

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end

  def my_profile
    unless current_user == @user
      flash[:alert] = "あなたのプロフィールではありません！"
      redirect_to root_path
    end
  end

  def set_user
    @user = User.find_by(user_name: params[:user_name])
  end


end
