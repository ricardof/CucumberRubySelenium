require 'selenium-webdriver'

# url being tested.
app_url = "https://www.guerrillamail.com/"

# Managing drivers in different os's maybe be too much of an effort, possibly the best solution is set a pre-inatallation requirement to run the tests.
driverPath = File.join(File.absolute_path('../..', File.dirname(__FILE__)), ENV["DRIVER_PATH"])

case ENV["BROWSER"].downcase
	when "chrome"
		Selenium::WebDriver::Chrome.driver_path = driverPath
	when "firefox"
		Selenium::WebDriver::Firefox::Binary.path = driverPath
	when "ie"
		Selenium::WebDriver::IE.driver_path = driverPath
	when "edge"
		Selenium::WebDriver::Edge.driver_path = driverPath
end

# Default resolution is 1080x720.
puts ENV["WIDTH"].nil? || ENV["HEIGHT"].nil?

if ENV["WIDTH"].nil? || ENV["HEIGHT"].nil?
	ENV["WIDTH"] = "1080"
	ENV["HEIGHT"] = "720"
end

$driver = nil

Before do
	case ENV["BROWSER"].downcase
		when "chrome"
			$driver = Selenium::WebDriver.for(:chrome)
		when "firefox"
			$driver = Selenium::WebDriver.for(:firefox)
		when "ie"
			$driver = Selenium::WebDriver.for(:ie)
		when "edge"
			$driver = Selenium::WebDriver.for(:edge)
		else
			fail("Desired browser '" + ENV["BROWSER"].downcase + "' is invalid.")
	end

	# Set implict wait to 1 second.
	$driver.manage.timeouts.implicit_wait = 2

	# Set browser position.
	# Not yet implemented in Edge browser.
	$driver.manage.window.position = Selenium::WebDriver::Point.new(0, 0)

	# Set browser dimensions.
	$driver.manage.window.size = Selenium::WebDriver::Dimension.new(ENV["WIDTH"].to_i, ENV["HEIGHT"].to_i)

	# Navigate to the following url.
	$driver.get(app_url)
end

After do
	# Close driver instance. (does not work with IE)
	if $driver != nil
		$driver.close()
		$driver = nil
	end
end

at_exit do
	# Close driver instance. (does not work with IE)
	if $driver != nil
		$driver.close()
	end
end
