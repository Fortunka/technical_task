describe "Cart" do

  before(:all) do
    @d = driver
    window_size
    @wait = wait
    @long_wait = long_wait
  end

  before(:each) do
    navigate_to
  end

  after(:all) do
    quit
  end

  RSpec.configure do |config|
  config.prepend_after(:each, type: :feature) do
    Capybara.execute_script 'localStorage.clear()'
  end
end


it "Correct item name is shown" do
   expect(product_header).to include("Этно-коттон 1200".upcase)
   product_item.click
   expect(product_quantity).to eq '1'
   add_to_cart_button.click
   @wait.until { find_el(:id, 'layer_cart').displayed? }
   expect(pop_up_quantity).to include "Количество 1"
   proceed_to_checkout_button.click
   @wait.until { find_el(:id, 'cart_title').displayed? }
   expect(product_item_in_cart).to include "Этно-коттон 1200 001 белый"
   @wait.until { find_el(:class, 'icon-trash').displayed? }
   clear_cart
  end

it "Correct price is shown" do

   #expect(shopping_cart_header).to include "(пусто)"
   expect(product_header).to include("Этно-коттон 1200".upcase)
   product_item.click
   expect(product_quantity).to eq '1'
   add_to_cart_button.click
   @wait.until { find_el(:id, 'layer_cart').displayed? }
   expect(pop_up_quantity).to include "Количество 1"
   proceed_to_checkout_button.click
   @wait.until { find_el(:id, 'cart_title').displayed? }
   expect(product_price_in_cart).to include("80,00 ₴")
  end
end