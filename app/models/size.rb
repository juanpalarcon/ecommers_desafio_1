class Size < ApplicationRecord
    has_many :variants
    has_many :products, through: :variants
end
