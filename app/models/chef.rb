class Chef < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :chefname, presence: true, length: {minimum: 0, maximum: 30 }
    validates :email, presence: true

    has_many:recipes

end