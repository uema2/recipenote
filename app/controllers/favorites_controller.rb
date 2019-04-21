class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.like(@recipe)
    redirect_to @recipe
  end

  def destroy
    @recipe = Favorite.find(params[:id]).recipe
    current_user.unlike(@recipe)
    redirect_to @recipe
  end
end
