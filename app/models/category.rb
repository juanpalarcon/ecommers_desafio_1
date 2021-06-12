class Category < ApplicationRecord
  has_and_belongs_to_many :products
  has_many :children, class_name: 'Category', dependent: :destroy
  belongs_to :parent, class_name: 'Category', foreign_key: :category_id, optional: true


  # scope :parents, -> {where(parent: nil)}

  def all_children
    self.children.flat_map do |child|
      child.all_children << child
    end
  end


  def self.all_parents
    where(category_id: nil)
  end

end
