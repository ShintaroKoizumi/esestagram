class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(pic_id: params[:pic_id])
    @pic = Pic.find(params[:pic_id])
    respond_to do |format|
      format.js { render template: 'favorites/create', locals: { favorite: @favorite, pic: @pic } } # 他のコントローラのテンプレートを表示
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.js { render template: 'favorites/destroy', locals: { favorite: favorite } }
    end
  end
end
