require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'ensures that a product will save properly' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "this", price: 234333, quantity: 2, category: category)
      expect(product).to be_present
    end

    it 'ensures that a product will save properly' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "this", price: 234333, quantity: 2, category: category)
      expect(product).to be_present
    end

    it 'ensures that a product will save properly' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "this", price: 234333, quantity: 2, category: category)
      expect(product).to be_present
    end

    it 'ensures that a product will save properly' do
      category = Category.create(name: "Apparel")
      product = Product.create(name: "this", price: 234333, quantity: 2, category: category)
      expect(product).to be_present
    end
  end
end
