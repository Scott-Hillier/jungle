require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'ensures that a product will save properly' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "name", price: 40, quantity: 2, category: category)
      expect(product).to be_present
    end

    it 'ensures it has a name' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: nil, price: 40, quantity: 2, category: category)
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'ensures it has a price' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "name", price_cents: nil, quantity: 2, category: category)
      expect(product.errors.full_messages).to include("Price cents can't be blank")
    end

    it 'ensures it has a quantity' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "name", price: 40, quantity: nil, category: category)
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'ensures it has a category' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "name", price: 40, quantity: 2, category: nil)
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
