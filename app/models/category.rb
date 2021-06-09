class Category < ApplicationRecord
  has_and_belongs_to_many :products
  has_many :children, class_name: 'Category'
  belongs_to :parent, class_name: 'Category', foreign_key: :category_id, optional: true
end
