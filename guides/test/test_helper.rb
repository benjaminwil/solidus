require 'rubygems'
require 'capybara'
require 'capybara/dsl'

Dir.chdir(File.dirname(__FILE__))

Capybara.current_driver = :selenium_chrome
Capybara.app_host = 'http://localhost:3000'
Capybara.save_path = 'screenshots'


# cursor input can be any of the following values: "default",
# "default-inverted", "drag", "drag-inverted", "pointer", "pointer-inverted"
class AnnotatedScreenshotTest
  include Capybara::DSL
  
  def create_cursor(input)
    beginning = File.open("cursor/begin.js")
    cursor = File.open("cursor/cursor-#{input}.js")
    ending = File.open("cursor/end.js")
    output = String.new

    [beginning, cursor, ending].each do |file|
      file.each_line do |line|
        output += line
      end
    end

    execute_script(output) 
  end
  
  def hover_on_link(text)
    find('a', text: text).hover
  end

end
