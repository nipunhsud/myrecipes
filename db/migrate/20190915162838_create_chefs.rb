class CreateChefs < ActiveRecord::Migration[5.2]
  def change
    create_table :chefs do |t|
      t.string :chefname
      t.string :email
      t.timestamp
    end
  end
end
