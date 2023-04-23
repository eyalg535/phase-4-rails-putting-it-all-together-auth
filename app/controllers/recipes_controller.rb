class RecipesController < ApplicationController
    def index
      render json: Recipe.includes(:user).all.to_json(include: { user: { only: [:username, :image_url, :bio] } })
    end
  
    def create
      recipe = @current_user.recipes.create!(recipe_params)
      render json: recipe.to_json(include: { user: { only: [:username, :image_url, :bio] } }), status: :created
    end
  
    private
  
    def recipe_params
      params.permit(:title, :instructions, :minutes_to_complete)
    end
  end
  