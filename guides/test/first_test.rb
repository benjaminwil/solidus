require_relative 'test_helper.rb'

module FirstTest
  class Test < AnnotatedScreenshotTest
    def test
      visit "/" 
      create_cursor "default"
      hover_on_link "LOGIN"
      page.save_and_open_screenshot
    end
  end
end

current_test = FirstTest::Test.new
current_test.test
