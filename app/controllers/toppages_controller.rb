class ToppagesController < ApplicationController
  def index
    @recipe = Recipe.all.order('updated_at DESC').page(params[:page]).per(12).search(params[:search])
    if @recipe.empty?
      flash.now[:danger] = '検索結果が得られませんでした。'
    end
  end
end
