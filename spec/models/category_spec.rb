require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category_1) { create(:category) }
  let(:category_2) { create(:category, category_id: category_1.id) }
   
  context 'when category does not have children' do 

    let(:category_without_children) { create(:category) }
    it "returns name correctly" do
    expect(category_without_children.name).to eq("description")
    end

    it "returns no children" do
      expect(category_without_children.children).to eq([])
    end
  end
  
  context 'when category has children' do
    
    it "returns parent correctly" do
      expect(category_2.parent).to eq(category_1)
    end

    it "returns children correctly" do
      expect(category_1.children).to eq([category_2 ])
    end
  end

  context 'when category does not have parents' do
  
    it "returns no parents" do
      expect(category_1.parent).to eq(nil)
    end
  end
end