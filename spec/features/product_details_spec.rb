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

  scenario "Naviagate from Home Page to Product Details page" do
    visit root_path
    page.first('article header').click
    find('.product-detail')
    puts page.html
    sleep(0.1) and save_screenshot ("product_details.png") #add 0.1ms sleep time in order to have photo loaded
    expect(page).to have_selector '.product-detail'
    save_screenshot ("test.png")
  end
  scenario "Naviagate from Home Page to Product Details page" do
    visit root_path
    find_link("Details »", match: :first).click
    find('.product-detail')
    puts page.html
    save_screenshot ("product_details1.png")
    expect(page).to have_selector '.product-detail'
  end
end
