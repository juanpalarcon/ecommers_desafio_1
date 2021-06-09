class AddParentToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories,  :categories, foreign_key: true
  end
end
