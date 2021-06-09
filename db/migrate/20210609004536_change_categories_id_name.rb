class ChangeCategoriesIdName < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :categories_id, :category_id
  end
end
