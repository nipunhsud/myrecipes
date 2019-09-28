require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @chef = Chef.create!(chefname: "Test", email: "Test@test.com")
    @recipe = @chef.recipes.create(name: "test veggie", description: "testing")
    # @recipe2 = @chef.recipes.create(name: "chicken test", description: "test")
    # @recipe2.save
  end
  
  test "should get recipes index" do
    get recipes_path
    assert_response :success
  end

  test "should get all recipes" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body
    # assert_match @recipe2.name, response.body
  end



end
