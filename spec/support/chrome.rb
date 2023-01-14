options = Selenium::WebDriver::Chrome::Options.new
options.add_preference(:download, prompt_for_download: false, default_directory: '/tmp/downloads')
options.add_preference(:browser, set_download_behavior: { behavior: 'allow' })
options.add_argument('--window-size=1400,900')

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: [options])
end

Capybara.register_driver :headless_chrome do |app|
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')

  driver = Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: [options])

  ### Allow file downloads in Google Chrome when headless!!!
  ### https://bugs.chromium.org/p/chromium/issues/detail?id=696481#c89
  bridge = driver.browser.send(:bridge)

  path = '/session/:session_id/chromium/send_command'
  path[':session_id'] = bridge.session_id

  bridge.http.call(
    :post,
    path,
    cmd: 'Page.setDownloadBehavior',
    params: {
      behavior: 'allow',
      downloadPath: '/tmp/downloads'
    }
  )

  driver
end

if ENV['HEADLESS_CHROME']
  Capybara.default_driver = :headless_chrome
  Capybara.javascript_driver = :headless_chrome
else
  Capybara.default_driver = :chrome
  Capybara.javascript_driver = :chrome
end
