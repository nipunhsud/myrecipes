require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

    def setup
        @chef = Chef.create!(chefname: "Test", email: "test@example.com")
        @recipe=  @chef.recipes.build(name: "Butter Chicken", description: "Great taste")
    end

    test "recipe should be valid" do
        assert @recipe.valid?
    end

    test "recipe without chef should be invalid" do
        @recipe.chef_id = nil
        assert_not @recipe.valid?
    end

    test "name should be present" do
        @recipe.name = ""
        assert_not @recipe.valid?
    end

    test "description should be present" do
        @recipe.description = ""
        assert_not @recipe.valid?
    end

    test "description should not be less than five char" do
        @recipe.description = "we"
        assert_not @recipe.valid?
    end

    test "description should be greater than 500 char" do
        @recipe.description = "a" * 600

        assert_not @recipe.valid?
    end

end