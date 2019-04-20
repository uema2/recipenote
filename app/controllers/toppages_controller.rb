class ToppagesController < ApplicationController
  def index
    @recipe = Recipe.all.order('updated_at DESC')
  end
end
