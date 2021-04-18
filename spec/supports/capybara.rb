Capybara.default_driver    = :remote_chrome
Capybara.javascript_driver = :remote_chrome

Capybara.register_driver :remote_chrome do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-gpu')
  options.add_argument('--window-size=1400,1400')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('disable-infobars')
  options.add_argument('--disable-extensions')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end


# ~~~
# Capybara.register_driver :remote_chrome do |app|
#   url = "http://chrome:4444/wd/hub"
#   caps = ::Selenium::WebDriver::Remote::Capabilities.chrome(
#     "goog:chromeOptions" => {
#       "args" => [
#         "no-sandbox",
#         "headless",
#         "disable-gpu",
#         "--disable-dev-shm-usage",
#         "disable-infobars",
#         "--disable-extensions",
#         "window-size=1680,1050"
#       ]
#     }
#   )
#   Capybara::Selenium::Driver.new(app, browser: :remote, url: url, desired_capabilities: caps)
# end

