require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'Model validation' do
    let(:user) { User.create(name: 'username') }
    let(:food) { Food.create(name: 'rice', measurement_unit: 'plates', price: 200, quantity: 4, user_id: user.id) }
    let(:recipe) do
      Recipe.new(name: 'Rice', preparation_time: 2.0, cooking_time: 3.0, public: true, user_id: user.id,
                 description: 'This is a test description')
    end

    subject { RecipeFood.new(quantity: 20, recipe_id: recipe.id, food_id: food.id) }

    before { subject.save }

    it 'Quantity value should be greater than 0' do
      subject.quantity = nil
      expect(subject).to_not be_valid

      subject.quantity = 0
      expect(subject).to_not be_valid

      subject.quantity = -100
      expect(subject).to_not be_valid
    end

    it 'Recipe id value should be present' do
      subject.recipe = nil
      expect(subject).to_not be_valid

      subject.recipe_id = nil
      expect(subject).to_not be_valid
    end

    it 'Food id value should be present' do
      subject.food_id = nil
      expect(subject).to_not be_valid

      subject.food_id = nil
      expect(subject).to_not be_valid
    end
  end
end
