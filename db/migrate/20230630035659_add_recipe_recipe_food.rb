class AddRecipeRecipeFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :recipe, references: :recipes, foreign_key: true, null: false
    remove_reference :recipe_foods, :user
  end
end
