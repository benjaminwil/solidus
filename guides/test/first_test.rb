require_relative 'test_helper.rb'

module MyCapybaraTest
  class Test
    include Capybara::DSL
    def go(url)
      visit url 
      create_mouse_pointer
      find('a', text: "Ruby on Rails Tote").hover
      page.save_and_open_screenshot
    end
  end
end

test = MyCapybaraTest::Test.new
test.go('/')

