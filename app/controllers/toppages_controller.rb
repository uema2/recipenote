class ToppagesController < ApplicationController
  def index
    @recipe = Recipe.all.order('updated_at DESC').page(params[:page]).per(12).search(params[:search])
  end
end
