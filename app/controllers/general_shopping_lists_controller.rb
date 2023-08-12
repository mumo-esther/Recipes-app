class GeneralShoppingListsController < ApplicationController
  def index
    @user = current_user
    @recipe_foods = @user.recipes.joins(recipe_foods: :food).select('recipe_foods.*, recipes.name AS recipe_name,
    foods.name AS food_name, foods.price AS food_price, foods.quantity AS food_quantity,
    foods.measurement_unit AS measurement_unit').to_a

    unique_recipe_foods = {}
    @recipe_foods.each do |recipe_food|
      existing_recipe_food = unique_recipe_foods[recipe_food.food_name]

      if existing_recipe_food
        existing_recipe_food.quantity += recipe_food.quantity
      else
        unique_recipe_foods[recipe_food.food_name] = recipe_food
      end
    end

    @recipe_foods = unique_recipe_foods.values
    @shopping_list_count = @recipe_foods.count
    @total_price = @recipe_foods.sum { |recipe_food| recipe_food.food_price * recipe_food.quantity }
  end
end
