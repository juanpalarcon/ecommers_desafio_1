require 'rails_helper'

RSpec.describe Category, type: :model do
    context 'when category does not have children ' do
    let(:category_without_children) { create(:category) } 
    let(:category_1) { create(:category) }
    let(:category_2) { create(:category, category_id: category_1.id) }

    it 'returns name correctly' do
      expect(category_without_children.name).to eq('description')
    end

    it 'returns nochiledren' do 
      expect(category_without_children.children).to eq([])
    end

    it 'returns parent correctly' do 
      expect(category_2.parent).to eq(category_1)
    end

  end

end
