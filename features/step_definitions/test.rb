require 'selenium-webdriver'

@email = nil

Given(/^I generated a new email$/) do
	email_widget = $driver.find_element(:id => 'email-widget')
	@email = email_widget.text
	if !@email.include? "@"
		@email = nil
		raise "Email was supposed to have at least a '@' char"
	else
		puts @email
	end
end

When(/^I send a new email to self$/) do
	compose_tab = $driver.find_element(:id => 'nav-item-compose')
	compose_tab.click()

	# Is the send form displayed?
	sendForm = $driver.find_element(:id => 'send-form')
	if !sendForm.displayed?
		raise "Send form is not visible."
	end

	to = $driver.find_element(:xpath => '//input[@class="form-field outline"][@name="to"]')
	subject = $driver.find_element(:xpath => '//input[@class="form-field outline"][@name="subject"]')
	body = $driver.find_element(:xpath => '//textarea[@class="form-field outline"][@name="body"]')
	sendButton = $driver.find_element(:id => 'send-button')

	to.send_keys(@email)
	subject.send_keys("Test")
	body.send_keys("This is a test email.")
	sendButton.click()
end

Then(/^I can see the new email in the inbox$/) do
	start = Time.now
	received = false

	begin
		sleep(1)
		# Is the inbox displayed?
		mailList = $driver.find_element(:xpath => '//tbody[@id="email_list"]')
		if mailList.displayed?
			emails = $driver.find_elements(:xpath => '//tbody[@id="email_list"]/tr')

			for mail in emails
				from = mail.find_element(:class_name => 'td2')

				if from.text.eql? (@email.split('@')[0] + "@guerrillamail.com")
					received = true
					break
				end
			end
		end
	end while ((Time.now - start).to_i < 15) && (received == false)

	if received == false
		raise "Email not received."
	end
end
