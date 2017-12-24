module FeatureSeleniumHelpers
  def driver
  	Selenium::WebDriver.for(:chrome)
  end

  def window_size
    target_size = Selenium::WebDriver::Dimension.new(1024, 2048)
    @d.manage.window.size = target_size
  end

  def wait
    Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def long_wait
    Selenium::WebDriver::Wait.new(:timeout => 180)
  end

  def navigate_to
    @d.navigate.to ('http://azuleta.com/ru/17-ethno-cotton-1200')
  end

  def url
    case ENV["URL"]
    when 'azuleta'
      "http://azuleta.com/ru/17-ethno-cotton-1200"
  end
end

  def quit
    @d.quit
  end


  ################### Helpers ###########################

  def click_upcase_link text
    find_el(:link, (text).upcase).click
  end

  def find_el by, cl
    @d.find_element(by, cl)
  end

  def find_els by, cl
    @d.find_elements(by, cl)
  end

  def clear_browsing_data
    @d.navigate.to ("chrome://settings/clearBrowserData")
    @d.find_elements(:id, 'clearBrowsingDataConfirm')
  end

  

  ################### HomePage Elements ###########################

  def shopping_cart_header
    find_el(:class, 'shopping_cart').text
  end

  def product_header
    find_el(:css, 'span.cat-name').text
  end

  def product_item
    find_el(:css, 'img[src*="http://azuleta.com/137-home_default/ethno-cotton-1200-001-white.jpg"]')
  end

  def product_quantity
    find_el(:id, "quantity_wanted")[:value]
   end

   def add_to_cart_button
    find_el(:name, "Submit")
   end

   ################### ConfirmPage Elements ###########################

   def pop_up_quantity
    find_el(:xpath, '//span[@class="title"]/following-sibling::*[2]').text
   end

   def proceed_to_checkout_button
    find_el(:xpath, '//*[@id="layer_cart"]/div[1]/div[2]/div[3]/a')
   end
 
  ################### Cart Elements ###########################

  def product_item_in_cart
    find_el(:xpath, '//*[@id="product_9_0_0_0"]/td[2]/p/a').text
  end

  def product_price_in_cart
    find_el(:id, 'total_price_container').text
  end

  def clear_cart
    find_el(:class, 'icon-trash').click
  end


end