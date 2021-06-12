class Product < ApplicationRecord
  has_and_belongs_to_many :categories

  has_many :order_items
  has_many :orders, through: :order_items

  has_many :variants
  has_many :sizes, through: :variants
  has_many :colors, through: :variants

# 
  def visible_con_catalogo?
    sel.variants.each do |variant| # buscamos cada stock del producto
      if variant.stock > 0 # si es mayor a 0 
        return true # el producto se muestra en catalogo
      else # si no 
        false # no se mostrara en el catalogo
      end
    end
  end

end
