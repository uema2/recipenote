class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    @recipe = Recipe.all.order('updated_at DESC').page(params[:page]).per(12)
  end
  
  def show
    @user = @recipe.user
    count(@recipe)
  end
  
  def new
    @recipe = current_user.recipes.build
  end
  
  def create
    @recipe = current_user.recipes.build(recipe_params)
    
    if @recipe.save
      flash[:success] = 'レシピを投稿しました。'
      redirect_to @recipe
    else
      flash.now[:danger] = 'レシピの投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end
  
  def destroy
    @recipe.destroy
    flash[:success] = 'レシピを削除しました。'
    redirect_to root_path
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, directions_attributes: [:id, :step, :_destroy], ingredients_attributes: [:id, :name, :amount, :_destroy])
  end
  
  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
  
  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    unless @recipe
      redirect_to root_url
    end
  end

end
