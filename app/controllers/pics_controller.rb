class PicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pic, only: [:show, :edit, :update, :destroy]
  before_action :my_pic, only: [:edit, :update, :destroy]

  def index
    @pics = Pic.all
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      flash[:success] = "投稿しました！！"
      redirect_to root_path
    else
      flash.now[:alert] = "投稿に失敗しました！ 内容を確認してください！"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      flash[:success] = "編集しました！"
      redirect_to root_path
    else
      flash.now[:alert] = "編集に失敗しました！ 内容を確認してください！"
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end


  private

  def pic_params
    params.require(:pic).permit(:caption, :image)
  end

  def set_pic
    @pic = Pic.find(params[:id])
  end

  def my_pic
    unless current_user == @pic.user
      flash[:alert] = "※あなたの投稿ではありません"
      redirect_to root_path
    end
  end
end
