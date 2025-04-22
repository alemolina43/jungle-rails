require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
   
    it "saves successfully when all fields are present" do
      @category = Category.create(name: 'Bob')
      @product = Product.new(
        name: 'Some Product',
        price: 9.99,
        quantity: 2,
        category: @category
      )
      expect(@product).to be_valid
    end

    it "is invalid without a name" do
      @category = Category.create(name: 'Bob')
      @product = Product.new(
        name: nil,
        price: 9.99,
        quantity: 2,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "is invalid without a price" do
      @category = Category.create(name: 'Bob')
      @product = Product.new(
        name: 'Some Product',
        price: nil,
        quantity: 2,
        category: @category
      )
      expect(@product).to_not be_valid
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Price cents must be greater than 0")
    end

    it "is invalid without a quantity" do
      @category = Category.create(name: 'Bob')
      @product = Product.new(
        name: 'Some Product',
        price: 10,
        quantity: nil,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is invalid without a category" do
      @product = Product.new(
        name: 'Some Product',
        price: 10,
        quantity: 2,
        category: nil
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category must exist")
    end
  end
end
