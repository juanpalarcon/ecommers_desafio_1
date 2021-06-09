class Product < ApplicationRecord
  has_and_belongs_to_many :categories

  has_many :order_items
  has_many :orders, through: :order_items

  has_many :variants
  has_many :sizes, through: :variants
  has_many :colors, through: :variants

end
