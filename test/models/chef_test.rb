require "test_helper"

class ChefTest < ActiveSupport::TestCase

    def setup
        @chef = Chef.new(chefname: "Aneta Lubas", email: "aneta.lubas@hotmail.com")
    end

    test "chef should be valid" do
        assert @chef.valid?
    end

    test "name should be present" do
        @chef.chefname = ""
        assert_not @chef.valid?
    end

    test "email should be present" do
        @chef.email = ""
        assert_not @chef.valid?
    end
    
    test "name less than 30 char" do
        @chef.chefname = "s" * 32
        assert_not @chef.valid?
    end

    test "email should be correct format" do
        valid_emails = %w[user@example.com]
        valid_emails.each do |valids|
        @chef.email = valids
        assert @chef.valid?, "#{valids.inspect} should be valid"
        end
    end

    test "email should be lower case before save" do
        mixed_email = "Jon@example.com"
        @chef.email = mixed_email
        @chef.save
        assert_equal mixed_email.downcase, @chef.reload.email
    end
end