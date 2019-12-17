require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  # product = Product.find(product.id)

  scenario "Naviagate from Home Page to Product Details page" do
    visit '/products/'
    page.all('article header')[1].click
    expect(page).to have_selector '.product-detail'
    save_screenshot ("product_details.png")
  end

end
