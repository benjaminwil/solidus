require 'rubygems'
require 'capybara'
require 'capybara/dsl'

Dir.chdir(File.dirname(__FILE__))

Capybara.current_driver = :selenium_chrome
Capybara.app_host = 'http://localhost:3000'
Capybara.save_path = 'screenshots'

def create_string(file)
  data = String.new 
  input= File.open(file) 
  input.each_line do |line|
    data += line
  end
  return data
end

def create_mouse_pointer
  mouse_pointer = create_string("pointer.js")
  execute_script(mouse_pointer)
end 

