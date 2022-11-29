class RecipesController < ApplicationController
  before_action : authorize
  def index
    recipes= Recipes.all
    render json:recipes
  end

  def create
  end
  private
  def authorize
    return render json: {error:"Not authorized"}, status: :unauthorized unless session.include? :user_id
  end
end
